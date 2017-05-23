//
//  JiaCordovaSandBoxHelper.h
//  JiaCordova  沙盒路径
//
//  Created by wujunyang on 2017/5/23.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JiaCordovaSandBoxHelper : NSObject

// 程序主目录，可见子目录(3个):Documents、Library、tmp
+ (NSString *)homePath;

// 程序目录，不能存任何东西
+ (NSString *)appPath;

// 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据
+ (NSString *)docPath;

// 配置目录，配置文件存这里
+ (NSString *)libPrefPath;

// 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
+ (NSString *)libCachePath;

// 临时缓存目录，APP退出后，系统可能会删除这里的内容
+ (NSString *)tmpPath;

//判断目录是否存在，不存在则创建
+ (BOOL)hasLive:(NSString *)path;

//判断目录是否存在
+(BOOL)hasOnlyLive:(NSString *)path;

//判断文件是否存在
+(BOOL)hasFileLive:(NSString *)path;

//获得资源的文件路径
+(NSString *)bundlePath:(NSString *)fileName;

//删除文件
+(void)deleteFile:(NSString *)path;
@end
