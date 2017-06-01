//
//  JiaCordovaModuleService.h
//  JiaCordova
//
//  Created by wujunyang on 2017/6/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiaYTKBaseRequest.h"
#import "JiaCordovaModel.h"

@interface JiaCordovaModuleService : JiaYTKBaseRequest

-(instancetype)initWithJiaCordovaApiModel:(JiaCordovaApiModel *)model;

@end
