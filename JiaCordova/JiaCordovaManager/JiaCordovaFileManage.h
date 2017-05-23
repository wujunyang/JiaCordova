//
//  JiaCordovaFileManage.h
//  JiaCordova 文件管理，下载ZIP 进行ZIP包解压
//
//  Created by wujunyang on 2017/5/22.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlockHandle)();

typedef void(^failBlockHanlde)(NSString *errorInfo);


@interface JiaCordovaFileManage : NSObject

//网络url 下载ZIP路径 folderName解压后的文件夹名  deleteZip解压完是否删除包 successBlock 成功回调failBlock 失败回调
-(void)loadFileWithUrl:(NSString *)url unZipFolderName:(NSString *)folderName deleteZip:(BOOL)deleteZip successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;


-(void)loadFileWithUrl:(NSString *)url successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;


//本地路径解压 文件名如 html.zip folderName解压后的文件夹名 successBlock 成功回调failBlock 失败回调
-(void)loadLocalFileName:(NSString *)fileName unZipFolderName:(NSString *)folderName successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;


//获得Cordova加载的文件夹
+(NSString *)jiaCordovaWWWFolder:(NSString *)folderName;

@end
