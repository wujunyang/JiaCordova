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

/**
 网络URL地址进行Zip包下载解压

 @param url zip地址
 @param folderName 解压后的文件夹名
 @param deleteZip 解压后是否进行删除zip包
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
-(void)loadFileWithUrl:(NSString *)url unZipFolderName:(NSString *)folderName deleteZip:(BOOL)deleteZip successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;



/**
 网络URL地址进行Zip包下载解压

 @param url zip地址
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
-(void)loadFileWithUrl:(NSString *)url successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;


/**
 工程内的ZIP资源包解压

 @param fileName ZIP文件名
 @param folderName 解压后的文件夹名
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
-(void)loadLocalFileName:(NSString *)fileName unZipFolderName:(NSString *)folderName successBlock:(successBlockHandle)successBlock failBlock:(failBlockHanlde)failBlock;


//获得Cordova加载的文件夹

/**
 返回沙盒对应解压的完整路径

 @param folderName 文件夹名
 @return 路径
 */
+(NSString *)jiaCordovaWWWFolder:(NSString *)folderName;

@end
