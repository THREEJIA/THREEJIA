//
//  AppDelegate.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "AppDelegate.h"
#import "YrFirstInViewController.h"
#import "AnimationViewController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "AFManager.h"
#import <SMS_SDK/SMSSDK.h>

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"


@interface AppDelegate ()

@property (nonatomic, strong) RDVTabBarController * tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SMSSDK registerApp:@"10cd3ef33df28" withSecret:@"53a5ea11f3c060511bcb0dfc3d5fff3e"];
    [self shareSDKinit];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YR" bundle:nil];
    
    [self initTabBar];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"首次启动");
        YrFirstInViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"scorll"];
        self.window.rootViewController = vc;
    }else {
        NSLog(@"非首次启动");
        AnimationViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"an"];
        self.window.rootViewController = vc;
        //这儿应该有动画到主界面
        //fix
        self.window.rootViewController = _tabBarController;
    }
    
    
    
    
    return YES;
}

- (void)shareSDKinit{
    [ShareSDK registerApp:@"10d20a0b52bf5"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"1134660933"
                                           appSecret:@"15dac8640a18215306a71cf4cfceb6a0"
                                         redirectUri:@"http://www.baidu.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                       appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"100371282"
                                      appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
}

- (void)initTabBar{
    _tabBarController = [[RDVTabBarController alloc] init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YR" bundle:nil];
    //fix  only test
    UIViewController *firstViewController =[[UIViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    UINavigationController * fouthNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"user"];
    
    [_tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,thirdNavigationController,fouthNavigationController]];
    //end
    
    NSArray *tabBarItemImages = @[@"home", @"mall", @"cart",@"user"];
    
    RDVTabBar *tabBar = [_tabBarController tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 44)];
    
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i<4; i++) {
        RDVTabBarItem * item = [[RDVTabBarItem alloc] init];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImages objectAtIndex:i]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarItemImages objectAtIndex:i]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = [tabBarItemImages objectAtIndex:i];
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName:[UIColor grayColor]};
        
        [arr addObject:item];
    }
    [[_tabBarController tabBar] setItems:arr];
    NSLog(@"yr_%lu",(unsigned long)[[_tabBarController tabBar] items].count);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
