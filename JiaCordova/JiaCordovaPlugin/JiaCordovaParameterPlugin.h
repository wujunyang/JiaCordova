//
//  JiaCordovaPlugin.h
//  JiaCordova
//
//  Created by wujunyang on 2017/5/25.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

extern NSString * const JiaCordovafromHtmlParameterNotification;

@interface JiaCordovaParameterPlugin : CDVPlugin

//存放参数 OC存放 JS从这个里面过滤出想要的参数
@property(nonatomic,strong,readwrite)NSDictionary *JiaParameter;

+ (JiaCordovaParameterPlugin *)sharedManager;

//OC接收到JS传过来的KEY数组参数 结合JiaParameter进行过滤 然后以字典回调给JS
-(void)requestParameterData:(CDVInvokedUrlCommand *)command;

//OC接收到JS传过来的字典参数 然后VC进行处理及业务处理 然后给JS一个成功的提示
-(void)fromHtmlParameterData:(CDVInvokedUrlCommand *)command;

@end
