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


-(instancetype)initConfigScheme:(NSString *)urlScheme
{
    NSURL *url=[NSURL URLWithString:urlScheme];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if ([elts count] < 2)
            continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    NSString *pageName =
    [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    return [self initConfigWithNetwork:NO folderName:url.host homePage:pageName parameter:params];
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
    
    //接收JS传过来要OC处理的参数
    [center addObserver:self selector:@selector(jiaCordovafromHtmlParameterHandle:) name:JiaCordovafromHtmlParameterNotification object:nil];
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


//子类创建jiaCordovafromHtmlParameterAction:(NSDictionary)直接获取到参数
- (void)jiaCordovafromHtmlParameterHandle:(NSNotification *)notification{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    SEL jiaCordovafromHtmlParameterSelector=@selector(jiaCordovafromHtmlParameterAction:);
    if([self respondsToSelector:jiaCordovafromHtmlParameterSelector])
    {
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:jiaCordovafromHtmlParameterSelector withObject:[notification userInfo]];
        
    }
#pragma clang diagnostic pop
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CDVPluginResetNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CDVPageDidLoadNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:JiaCordovafromHtmlParameterNotification object:nil];
}

@end
