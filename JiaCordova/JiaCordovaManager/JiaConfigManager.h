//
//  JiaConfigManager.h
//  JiaCordova
//
//  Created by wujunyang on 2017/6/1.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiaCordovaModel.h"

@interface JiaConfigManager : NSObject

@property(nonatomic,strong)JiaCordovaApiModel *jiaCordovaApiModel;

+ (JiaConfigManager *)sharedManager;

@end
