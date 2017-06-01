//
//  JiaCordvoaModel.h
//  JiaCordova
//
//  Created by wujunyang on 2017/6/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JiaCordovaModel : NSObject

@end



/**
 请求API传递的内容
 */
@interface JiaCordovaApiModel : NSObject

//请示的URL
@property(nonatomic,copy)NSString *httpUrl;

//头部信息
@property(nonatomic,copy)NSDictionary *headerDictionary;

//参数
@property(nonatomic,copy)NSDictionary *bodyDictionary;

@end




/**
 功能模块的信息
 */
@interface JiaCordovaModularModel : NSObject

//对应的功能模块标识名（唯一性）
@property(nonatomic,copy)NSString *modularName;

//ZIP包的路径
@property(nonatomic,copy)NSString *zipPath;

//对应的版本号 如 1.0.1
@property(nonatomic,strong)NSNumber *version;

//对应的功能模块中文名
@property(nonatomic,copy)NSString *name;

//对应的起始页面
@property(nonatomic,copy)NSString *homePage;

@end
