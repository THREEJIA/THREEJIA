//
//  YrUserViewController.h
//  GeGeJia
//
//  Created by Mac on 16/3/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YrUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *resignInBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)signinAction:(UIButton *)sender;
- (IBAction)loginAction:(UIButton *)sender;

@end
