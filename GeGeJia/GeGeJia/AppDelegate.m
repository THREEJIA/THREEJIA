//
//  AppDelegate.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "AppDelegate.h"
<<<<<<< HEAD
#import "YrFirstInViewController.h"
#import "AnimationViewController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>


@interface AppDelegate ()

@property (nonatomic, strong) RDVTabBarController * tabBarController;

=======

@interface AppDelegate ()

>>>>>>> 1cf7506efd2c46b1d4a6e01166e538897e4a102d
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
<<<<<<< HEAD
    
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

- (void)initTabBar{
    _tabBarController = [[RDVTabBarController alloc] init];
    //fix  only test
    UIViewController *firstViewController =[[UIViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    UIViewController *fouthViewController = [[UIViewController alloc] init];
    UIViewController *fouthNavigationController = [[UINavigationController alloc]initWithRootViewController:fouthViewController];
    
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

=======
    // Override point for customization after application launch.
    return YES;
}

>>>>>>> 1cf7506efd2c46b1d4a6e01166e538897e4a102d
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
