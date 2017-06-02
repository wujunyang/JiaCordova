//
//  TestCordovaViewController.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/24.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "TestCordovaViewController.h"

@interface TestCordovaViewController ()

@end

@implementation TestCordovaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)jiaCordovafromHtmlParameterAction:(NSDictionary *)dictionary
{
    if (dictionary.count==0) {
        return;
    }
    //可以前后端约定好相应的参数值 进行业务的处理
    NSNumber *loginState=dictionary[@"LoginStatus"];
    NSLog(@"OC收到参数了：%@",dictionary);
    
    if(![loginState boolValue])
    {
        NSLog(@"跳转到登录");
    }
}

@end
