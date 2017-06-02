//
//  JiaCordovaFileManage.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/22.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaFileManage.h"
#import "JiaCordovaSandBoxHelper.h"
#import "JiaCordovaDownloadService.h"
#import "JiaCordovaModuleService.h"
#import "JiaConfigManager.h"
#import "SSZipArchive.h"
#import "JiaAFNetworking.h"
#import "JiaCordovaModel.h"

@interface JiaCordovaFileManage()

//成功回调
@property(nonatomic,copy)successBlockHandle successHandle;
//失败回调
@property(nonatomic,copy)failBlockHanlde failHandle;
//下载路径
@property(nonatomic,copy)NSString *downloadUrl;
//解压的文件夹名
@property(nonatomic,copy)NSString *jiaCordovaFolderName;
//解压的文件名
@property(nonatomic,copy)NSString *jiaCordovaZipFileName;
//解压完成后是否进行删除
@property(nonatomic)BOOL deleteZip;

@end

@implementation JiaCordovaFileManage

+(void)startRequest
{
    JiaCordovaFileManage *manager=[[JiaCordovaFileManage alloc]init];
    
    JiaCordovaModuleService *req=[[JiaCordovaModuleService alloc]initWithJiaCordovaApiModel:[JiaConfigManager sharedManager].jiaCordovaApiModel];
    
    [req startWithCompletionBlockWithSuccess:^(__kindof JiaYTKBaseRequest * _Nonnull request) {
        JiaCordovaModel *model=[[JiaCordovaModel alloc]initWithString:request.responseString error:nil];
        if ([model.status isEqualToString:@"0"]) {
            manager.failHandle(model.message);
            return;
        }
        
        
        
    } failure:^(__kindof JiaYTKBaseRequest * _Nonnull request) {
        manager.failHandle(@"请求接口下载失败");
    }];
}


-(void)loadFileWithUrl:(NSString *)url successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock
{
    [self loadFileWithUrl:url unZipFolderName:nil deleteZip:YES successBlock:successBlock failBlock:failBlock];
}


-(void)loadFileWithUrl:(NSString *)url unZipFolderName:(NSString *)folderName deleteZip:(BOOL)deleteZip successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock
{
    _successHandle=successBlock;
    _failHandle=failBlock;
    _downloadUrl=url;
    _deleteZip=deleteZip;
    
    [self getFileInfoWithFolderName:folderName];
    
    [self downloadFileFromUrl];
}


-(void)loadLocalFileName:(NSString *)fileName unZipFolderName:(NSString *)folderName successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock
{
    _successHandle=successBlock;
    _failHandle=failBlock;
    _downloadUrl=[JiaCordovaSandBoxHelper bundlePath:fileName];
    
    [self getFileInfoWithFolderName:folderName];
    
    //解压后的文件路径
    NSString *unZipPath=[[JiaCordovaSandBoxHelper docPath] stringByAppendingPathComponent:_jiaCordovaFolderName];
    
    //如果存在路径就不进行解压（因为第一次都有本地路径进行解压，以后从网络加载解压）
    if ([JiaCordovaSandBoxHelper hasOnlyLive:unZipPath]) {
        return  failBlock(@"已经存在文件夹路径");
    }
    
    [self unZipWithPath:_downloadUrl];
}

//获取到一些文件信息
-(void)getFileInfoWithFolderName:(NSString *)folderName
{
    if (_downloadUrl.length==0) {
        return _failHandle(@"当前下载地址为空");
    }
    
    NSString *extensionName=[_downloadUrl pathExtension].lowercaseString;
    
    if (![extensionName isEqualToString:@"zip"]) {
        return _failHandle(@"当前下载文件不是ZIP包");
    }
    
    
    _jiaCordovaFolderName=folderName;
    if (folderName==nil) {
        _jiaCordovaFolderName=[self fileNameFromUrl];
    }
    
    _jiaCordovaZipFileName=[_downloadUrl lastPathComponent];
}

//获取文件名称不带后缀
-(NSString *)fileNameFromUrl
{
    NSString *fileName=[[_downloadUrl lastPathComponent] stringByDeletingPathExtension];
    
    if(fileName.length==0)
    {
        fileName=@"JiaCordovaFile";
    }
    
    return fileName;
}

//进行下载操作
-(void)downloadFileFromUrl
{
    //定义下载的存放路径
    NSString *DownloadPath=[[JiaCordovaSandBoxHelper docPath] stringByAppendingPathComponent:_jiaCordovaZipFileName];
    
//    //进行下载请求操作
    JiaCordovaDownloadService *serviceReq=[[JiaCordovaDownloadService alloc] initWitDownloadhUrl:_downloadUrl withDownloadPath:DownloadPath];
    
    [serviceReq startWithCompletionBlockWithSuccess:^(__kindof JiaYTKBaseRequest * _Nonnull request) {
        [self unZipWithPath:DownloadPath];
    } failure:^(__kindof JiaYTKBaseRequest * _Nonnull request) {
        return _failHandle(@"下载文件出错");
    }];
}

//进行解压操作
-(void)unZipWithPath:(NSString *)filePath
{
    if (![JiaCordovaSandBoxHelper hasFileLive:filePath]) {
        return _failHandle(@"存储的文件本地路径不存在");
    }
    
    //解压后的文件路径
    NSString *unZipPath=[[JiaCordovaSandBoxHelper docPath] stringByAppendingPathComponent:_jiaCordovaFolderName];
    
    //查看是否存在这个文件夹 不存在则创建
    [JiaCordovaSandBoxHelper hasLive:unZipPath];
    
    //存在则进行解压
    [SSZipArchive unzipFileAtPath:filePath toDestination:unZipPath progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
        
    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                return _failHandle(@"解压失败");
            });
        }
        
        if (_deleteZip) {
            [JiaCordovaSandBoxHelper deleteFile:filePath];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            return _successHandle(@"解压成功");
        });
    }];
}


+(NSString *)jiaCordovaWWWFolder:(NSString *)folderName
{
    return [NSString stringWithFormat:@"file://%@/%@",[JiaCordovaSandBoxHelper docPath],folderName];
}
@end
