//
//  JiaCordovaPlugin.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/25.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaParameterPlugin.h"

@interface JiaCordovaParameterPlugin()

@end


@implementation JiaCordovaParameterPlugin

+ (JiaCordovaParameterPlugin *)sharedManager
{
    static JiaCordovaParameterPlugin *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[JiaCordovaParameterPlugin alloc] init];
    });
    return _sharedManager;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        _JiaParameter=[[NSDictionary alloc]init];
    }
    return self;
}


-(void)requestParameterData:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult=nil;
    
    //判断OC这边是否有参数赋值
    if (![JiaCordovaParameterPlugin sharedManager].JiaParameter) {
        pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"当前没有参数"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    //从JS那传过来的参数
    NSArray *options=[command argumentAtIndex:0];
    
    //创建回传给JS的参数
    NSMutableDictionary *jsParameter=[[NSMutableDictionary alloc]initWithCapacity:options.count];
    
    for (NSString *item in options) {
        NSString *itemResult=[[JiaCordovaParameterPlugin sharedManager].JiaParameter valueForKey:item];
        [jsParameter setObject:itemResult forKey:item];
    }
    
    pluginResult=[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:jsParameter];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
