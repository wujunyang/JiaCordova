//
//  DataViewController.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/22.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "DataViewController.h"
#import "JiaAFNetworking.h"
#import "TestCordovaViewController.h"

@interface DataViewController ()


@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    
    [self.view addGestureRecognizer:singleTap];
}


-(void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    NSLog(@"当前路径：%@",[JiaCordovaFileManage jiaCordovaWWWFolder:@"www"]);
    //TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:NO folderName:@"www" homePage:@"index.html" parameter:nil];
    
    //远程访问
    TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:YES folderName:@"" homePage:@"http://www.cnblogs.com/" parameter:nil];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


@end
