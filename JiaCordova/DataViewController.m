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

@property(nonatomic,strong)UIButton *httpButtom,*localButtom;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    
    [self.view addGestureRecognizer:singleTap];
    
    
    [self.view addSubview:self.httpButtom];
    [self.view addSubview:self.localButtom];
}


-(void)handleSingleTap:(UITapGestureRecognizer *)sender
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


-(UIButton *)httpButtom
{
    if (!_httpButtom) {
        _httpButtom=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, 200, 40)];
        _httpButtom.tag=1001;
        [_httpButtom setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_httpButtom setTitle:@"跳转到远程网址" forState:UIControlStateNormal];
        [_httpButtom addTarget:self  action:@selector(goPageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _httpButtom;
}

-(UIButton *)localButtom
{
    if (!_localButtom) {
        _localButtom=[[UIButton alloc]initWithFrame:CGRectMake(10, 150, 200, 40)];
        _localButtom.tag=1002;
        [_localButtom setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_localButtom setTitle:@"跳转沙盒html页面" forState:UIControlStateNormal];
        [_localButtom addTarget:self  action:@selector(goPageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _localButtom;
}

-(void)goPageAction:(UIButton *)sender
{
    NSInteger index=sender.tag;
    if (index==1001) {
        
        
        //远程访问
        TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:YES folderName:@"" homePage:@"http://www.cnblogs.com/" parameter:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index==1002)
    {
        NSDictionary *dic=@{@"name":@"wujunyang",@"projectID":@"12345"};
        
        
        TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:NO folderName:@"wwws" homePage:@"index.html" parameter:dic];
        // [self presentViewController:vc animated:YES completion:nil];
        //self.navigationController.navigationBar.hidden=YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
