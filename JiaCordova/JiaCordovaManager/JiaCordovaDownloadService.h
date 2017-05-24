//
//  JiaCordovaDownloadService.h
//  JiaCordova
//
//  Created by wujunyang on 2017/5/23.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiaYTKBaseRequest.h"

@interface JiaCordovaDownloadService : JiaYTKBaseRequest


/**
 网络下载请求任务

 @param downloadUrl 下载的网络地址(http://xxxx.zip)
 @param downLoadPath 当前下载zip存的地址
 @return <#return value description#>
 */
-(instancetype)initWitDownloadhUrl:(NSString *)downloadUrl withDownloadPath:(NSString *)downLoadPath;

@end
