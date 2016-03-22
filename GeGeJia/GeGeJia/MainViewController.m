//
//  ViewController.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "MainViewController.h"

#import <AFNetworking/AFNetworking.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleScrollerView.contentSize = CGSizeMake(500, 44);
    

    
}

- (void)createTitleButton
{
    NSArray *titleNameArr = @[@"首页",@"休闲零食",@"保健滋补",@"母婴辅食",@"最后疯抢",@"即将开抢"];
    for (int i = 0 ; i < 6 ; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:titleNameArr[i] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
