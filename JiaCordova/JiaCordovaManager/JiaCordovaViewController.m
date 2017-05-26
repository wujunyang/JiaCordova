//
//  JiaCordovaViewController.m
//  JiaCordova
//
//  Created by wujunyang on 2017/5/22.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "JiaCordovaViewController.h"
#import "JiaCordovaFileManage.h"
#import "JiaMBProgressHUD.h"
#import "JiaMBProgressHUD+MP.h"
#import "JiaCordovaParameterPlugin.h"

@interface JiaCordovaViewController ()
@property(nonatomic,assign)BOOL jiaIsNetwork;
@property(nonatomic,copy)NSString *jiaFoldName,*jiaHomePage;
@property(nonatomic,strong)NSDictionary *jiaParameter;
@end

@implementation JiaCordovaViewController

-(instancetype)initConfigWithNetwork:(BOOL)isNetwork folderName:(NSString *)folderName homePage:(NSString *)homePage parameter:(NSDictionary *)parameter
{
    self=[super init];
    if (self) {
        _jiaIsNetwork=isNetwork;
        _jiaFoldName=folderName;
        _jiaHomePage=homePage;
        if (!_jiaParameter) {
            _jiaParameter=[[NSDictionary alloc]init];
        }
        _jiaParameter=parameter;
        
        [self configParameter];
        
        [self configLoadInfo];
    }
    return self;
}


-(void)configLoadInfo
{
    self.startPage=@"index.html";
    
    //是否是请求网络的html页面
    if(_jiaIsNetwork&&_jiaHomePage)
    {
        self.startPage=_jiaHomePage;
        return;
    }

    self.wwwFolderName=@"www";
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[JiaCordovaFileManage jiaCordovaWWWFolder:_jiaFoldName]]) {
        self.wwwFolderName=[JiaCordovaFileManage jiaCordovaWWWFolder:_jiaFoldName];
    }
    
    //非网络加载本地不存在时 则直接跳转到www index.html
}

-(void)configParameter
{
    [JiaCordovaParameterPlugin sharedManager].JiaParameter=_jiaParameter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.frame=CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(onNotification:)
                   name:CDVPluginResetNotification  // 开始加载
                 object:nil];
    [center addObserver:self
               selector:@selector(onNotificationed:)
                   name:CDVPageDidLoadNotification  // 加载完成
                 object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onNotification:(NSNotification *)text{
    NSLog(@"－－－－－开始加载页面------");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    [JiaMBProgressHUD showProgressToView:nil Text:@"加载页面中...."];
}


- (void)onNotificationed:(NSNotification *)text{
    NSLog(@"－－－－－结束加载页面------");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [JiaMBProgressHUD hideHUD];
}

@end
