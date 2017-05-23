//
//  JiaCordovaDownloadService.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/23.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaDownloadService.h"

@interface JiaCordovaDownloadService()
{
    NSString *_downloadUrl;
    NSString *_downLoadPath;
}
@end

@implementation JiaCordovaDownloadService

-(instancetype)initWitDownloadhUrl:(NSString *)downloadUrl  withDownloadPath:(NSString *)downLoadPath
{
    self=[super init];
    if (self) {
        _downloadUrl=downloadUrl;
        _downLoadPath=downLoadPath;
    }
    return self;
}

- (NSString *)requestUrl {
    return _downloadUrl;
}

- (JiaYTKRequestMethod)requestMethod {
    return JiaYTKRequestMethodGET;
}


- (NSString *)resumableDownloadPath {
    return _downLoadPath;
}

@end
