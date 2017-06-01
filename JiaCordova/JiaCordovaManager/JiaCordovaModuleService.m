//
//  JiaCordovaModuleService.m
//  JiaCordova
//
//  Created by wujunyang on 2017/6/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaModuleService.h"

@interface JiaCordovaModuleService()
{
    JiaCordovaApiModel *_myJiaCordovaApiModel;
}
@end

@implementation JiaCordovaModuleService

-(instancetype)initWithJiaCordovaApiModel:(JiaCordovaApiModel *)model
{
    self=[super init];
    if (self) {
        _myJiaCordovaApiModel=model;
    }
    return self;
}

- (NSString *)requestUrl {
    return _myJiaCordovaApiModel.httpUrl;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary
{
    return _myJiaCordovaApiModel.headerDictionary;
}

- (JiaYTKRequestMethod)requestMethod {
    return JiaYTKRequestMethodPOST;
}

- (id)requestArgument {
    return _myJiaCordovaApiModel.bodyDictionary;
}

@end
