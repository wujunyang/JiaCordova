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

-(instancetype)initWitDownloadhUrl:(NSString *)downloadUrl withDownloadPath:(NSString *)downLoadPath;

@end
