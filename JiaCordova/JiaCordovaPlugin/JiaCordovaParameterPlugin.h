//
//  JiaCordovaPlugin.h
//  JiaCordova
//
//  Created by wujunyang on 2017/5/25.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface JiaCordovaParameterPlugin : CDVPlugin

//存放参数
@property(nonatomic,strong)NSDictionary *JiaParameter;

+ (JiaCordovaParameterPlugin *)sharedManager;

-(void)requestParameterData:(CDVInvokedUrlCommand *)command;

@end
