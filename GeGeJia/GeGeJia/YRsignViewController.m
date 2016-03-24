//
//  YRsignViewController.m
//  GeGeJia
//
//  Created by Mac on 16/3/23.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "YRsignViewController.h"
#import "YRsignTableViewCell.h"
#import <RDVTabBarController.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"

@interface YRsignViewController ()
@property (nonatomic,strong) NSArray * cellArr;

@end

@implementation YRsignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellArr = @[@"1",@"2",@"3"];
    // Do any additional setup after loading the view.
    RDVTabBarController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    [controller setTabBarHidden:YES animated:YES];
}



- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)loginQQ:(UIButton *)sender {
}

- (IBAction)loginWeibo:(UIButton *)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            
            NSLog(@"uid=%@",user.uid);
            NSLog(@"%@",user.credential);
            NSLog(@"token=%@",user.credential.token);
            NSLog(@"nickname=%@",user.nickname);
        }
        
        else
        {
            NSLog(@"%@",error);
        }
    }];
}

- (IBAction)LoginWeiXin:(UIButton *)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
