//
//  JiaCordovaSandBoxHelper.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/23.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaSandBoxHelper.h"

@implementation JiaCordovaSandBoxHelper

+ (NSString *)homePath{
    return NSHomeDirectory();
}

+ (NSString *)appPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)docPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)libPrefPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)libCachePath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)tmpPath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}

+ (BOOL)hasLive:(NSString *)path
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
    {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    return NO;
}

+(BOOL)hasOnlyLive:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}


+(BOOL)hasFileLive:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:path];
}


+(NSString *)bundlePath:(NSString *)fileName
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}


+(void)deleteFile:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path error:nil];
    }
}

@end
