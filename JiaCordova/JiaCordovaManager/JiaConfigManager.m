//
//  JiaConfigManager.m
//  JiaCordova
//
//  Created by wujunyang on 2017/6/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaConfigManager.h"

@implementation JiaConfigManager

+ (JiaConfigManager *)sharedManager
{
    static JiaConfigManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[JiaConfigManager alloc] init];
    });
    return _sharedManager;
}

@end
