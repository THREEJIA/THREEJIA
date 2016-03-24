//
//  YrUserViewController.m
//  GeGeJia
//
//  Created by Mac on 16/3/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "YrUserViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "YRUserCollectionViewCell.h"


//#import

@interface YrUserViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSArray * itemImageArr;
@property (nonatomic, strong) NSArray * itemLabelArr;
@end

@implementation YrUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    _loginBtn.layer.borderWidth = 1;
    _loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _resignInBtn.layer.borderWidth = 1;
    _resignInBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    //_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _collectionView.scrollEnabled = NO;
    _itemImageArr = @[@"user_about",@"user_addr",@"user_fav",@"user_feedback",@"user_invite",@"user_order",@"user_contact",@"user_contact"];
    _itemLabelArr = @[@"签到",@"收藏",@"优惠券",@"邀请小伙伴",@"客户与帮助",@"意见与反馈",@"积分",@"关于格格家"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rr" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ss" forIndexPath:indexPath];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 50;
    }else{
        return 65;
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = self.tableView.contentOffset.y;
    //向上偏移量变正  向下偏移量变负
    if (yOffset < -64) {
        CGFloat factor = ABS(yOffset)+150-64;
        CGRect f = CGRectMake(-([[UIScreen mainScreen] bounds].size.width*factor/150-[[UIScreen mainScreen] bounds].size.width)/2,-ABS(yOffset)+64, [[UIScreen mainScreen] bounds].size.width*factor/150, factor);
        _headerImage.frame = f;
    }else {
        CGRect f = _headerView.frame;
        f.origin.y = 0;
        _headerView.frame = f;
        _headerImage.frame = CGRectMake(0, f.origin.y, [[UIScreen mainScreen] bounds].size.width, 150);
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _itemLabelArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YRUserCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"ee" forIndexPath:indexPath];
    NSLog(@"%d",indexPath.row);
    item.image.image = [UIImage imageNamed:_itemImageArr[indexPath.row]];
    item.label.text = _itemLabelArr[indexPath.row];
    return item;
}

- (IBAction)signinAction:(UIButton *)sender {
    //注册
    //    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"18200392518" zone:@"86" customIdentifier:nil result:^(NSError *error) {
    //        
    //    }];
    //    [SMSSDKUI showVerificationCodeViewWithMetohd:SMSGetCodeMethodSMS result:^(enum SMSUIResponseState state,NSString *phoneNumber,NSString *zone, NSError *error) {
    //        
    //    }];
}

- (IBAction)loginAction:(UIButton *)sender {
    //登陆
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
