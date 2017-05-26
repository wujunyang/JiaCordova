![](https://img.shields.io/badge/platform-ios-blue.svg) ![](https://img.shields.io/badge/language-OC-orange.svg) ![](https://img.shields.io/cocoapods/l/JiaCordova.svg?style=flat) ![](https://img.shields.io/cocoapods/v/JiaCordova.svg?style=flat) [![](https://img.shields.io/badge/Blog-@wujunyang-brightgreen.svg)](http://www.cnblogs.com/wujy/)


## JiaCordova介绍

JiaCordova是为了让项目对于Cordova引入更加方便快捷的一个封装式插件，插件中已经集成的关于Cordova跟其一些常用的第三库，对于Cordova的配置模板也进行整理，且封装从服务端下载ZIP包进行解压到沙盒文件夹中，利用Cordova进行请求的功能；最大程度上简化关于Cordova的运用跟学习成本；


## Cordova理论知识点

Cordova提供了一组设备相关的API，通过这组API，移动应用能够以JavaScript访问原生的设备功能，如摄像头、麦克风等。Cordova还提供了一组统一的JavaScript类库，以及为这些类库所用的设备相关的原生后台代码。Cordova支持如下移动操作系统：iOS, Android,ubuntu phone os, Blackberry, Windows Phone, Palm WebOS, Bada 和 Symbian。

<img src="https://github.com/wujunyang/JiaCordova/blob/master/1.png" width=400px height=400px></img>


## JiaCordova运用

####  一：引用方式

```obj-c

pod 'JiaCordova'

```

只要简单运用Pod指令并可以引入，目前iOS最低版本支持为8.0


####  二：资源文件引入

目前在插件中有两种方式进行引入资源文件（html页面、JS脚本、CCS文件等），都是以ZIP包进行存放；

<img src="https://github.com/wujunyang/JiaCordova/blob/master/3.png" width=550px height=300px></img>

1：第一种是存放在工程中的某个目录中，然后APP第一次运行时就会实现对它进行解压；实现的代码如下：

```obj-c

    JiaCordovaFileManage *fileManager=[[JiaCordovaFileManage alloc]init];
    [fileManager loadLocalFileName:@"html.zip" unZipFolderName:@"www" successBlock:^{
        NSLog(@"成功");
    } failBlock:^(NSString *errorInfo) {
        NSLog(@"失败");
    }];

```

其中html.zip就是对应的资源压缩包，而unZipFoldName就是解压后在沙盒目录下的文件夹名称，如果unZipFoldName则会默认以资源包的名称作为其解压后的名称；

2：第二种则是通过网络请求到的资源包，插件会进行下载并对它进行解压；实现的代码如下：

```obj-c

    JiaCordovaFileManage *fileManager=[[JiaCordovaFileManage alloc]init];
    
    [fileManager loadFileWithUrl:@"http://test.qshmall.net:9090/html.zip" unZipFolderName:@"html" deleteZip:YES successBlock:^{
        
    } failBlock:^(NSString *errorInfo) {
        
    }];

```

其中相应的参数类似第一种，而deleteZip是为了标识当解压成功后是否要对ZIP包进行删除；


####  三：项目页面使用

在插件中已经封装的一个控制器JiaCordovaViewController页面，对于一些常规的操作跟设置进行处理；只要简单让项目要做为Cordova的页面继承于它就可以；如下的代码实现：

```obj-c

   #import "JiaCordovaHeader.h"

   @interface TestCordovaViewController : JiaCordovaViewController

   @end


```

然后就可以实现请求的方式，这边同样也是区分的沙盒中的页面还是远端的网页；

1：请求网页的方式，

```obj-c

   TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:YES folderName:@"" homePage:@"http://www.cnblogs.com/" parameter:nil];
   [self.navigationController pushViewController:vc animated:YES];

```

2：请求沙盒的方式

```obj-c

   TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:NO folderName:@"www" homePage:@"index.html" parameter:nil];
   [self.navigationController pushViewController:vc animated:YES];

```

其中parameter是存放参数，可以让JS进行调用，JS就可以动态获取到本身自个想要的参数，上面这两种方式都有做容错处理，假如不存在页面时都会默认跳到项目中提供的一个错误提示页面；

####  四：JS获取OC的参数

对于传参除了直接在url地址拼成以外，JiaCordova里面还通过一个JiaCordovaParameterPlugin插件实现交互，js可以把想获取到的参数的key值以数组的形式传给JiaCordovaParameterPlugin，会自动完成先前传参时的过滤然后再把对应的值回传给前端html页面；

<img src="https://github.com/wujunyang/JiaCordova/blob/master/4.png" width=550px height=300px></img>

```obj-c
        var options=new Array("name");
        alert(options);
        cordova.exec(
                     function(result){
                     var s=result;
                     
                     alert(s);
                     
                     for(var key in result )
                     {
                       var value=  result[key];
                       alert(key+":"+value);
                     }
                     
                     },
                     function(error)
                     {
                       alert("error",error);
                     }
                     ,'JiaCordovaParameterPlugin','requestParameterData',[options]);

```

上面代码就是想获取OC中参数字典中key为name的值；如果你有多个参数都可以增加到数组中；但前提是客户端OC参数里面要有对应的key;

```obj-c

      NSDictionary *dic=@{@"name":@"wujunyang",@"projectID":@"12345"};
        
      TestCordovaViewController *vc=[[TestCordovaViewController alloc]initConfigWithNetwork:NO folderName:@"wwws" homePage:@"index.html" parameter:dic];

```

因为OC的字典已经存在name的key,所以它会把这个值过滤出来，并赋值成字典回传给JS；完成对于参数的动调获取；

####  五：效果展现

<img src="https://github.com/wujunyang/JiaCordova/blob/master/2.gif" width=200px height=300px></img>


## 联系方式

如果你在使用过程中有什么不明白或者问题可以wujunyang@126.com联系，当然如果你有时间也可以一起维护

## 许可

JiaCordova 使用 MIT 许可证，详情可见 LICENSE 文件。
