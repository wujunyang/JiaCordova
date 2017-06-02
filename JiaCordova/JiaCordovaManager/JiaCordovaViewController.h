//
//  JiaCordovaViewController.h
//  JiaCordova
//
//  Created by wujunyang on 2017/5/22.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Cordova/CDV.h>

@interface JiaCordovaViewController : CDVViewController


/**
 初始化跳转

 @param isNetwork 是否远程页面
 @param folderName 如果是存沙盒 对应的文件夹名称
 @param homePage 加载时的起始页 如果是远程则要是http://xxx.html  若是本地则只要 x.html
 @param parameter 传参数
 @return <#return value description#>
 */
-(instancetype)initConfigWithNetwork:(BOOL)isNetwork folderName:(NSString *)folderName homePage:(NSString *)homePage parameter:(NSDictionary *)parameter;



/**
 初始化跳转

 @param urlScheme urlScheme字符串样式   jia-webview://moudleA/index.html?id=1234&name=wujunyang
 @return <#return value description#>
 */
-(instancetype)initConfigScheme:(NSString *)urlScheme;

@end
