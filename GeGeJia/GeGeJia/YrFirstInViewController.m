//
//  YrFirstInViewController.m
//  GeGeJia
//
//  Created by Mac on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "YrFirstInViewController.h"
<<<<<<< HEAD
//test
#import "AnimationViewController.h"

@interface YrFirstInViewController ()<UIScrollViewDelegate>
=======

@interface YrFirstInViewController ()
>>>>>>> 1cf7506efd2c46b1d4a6e01166e538897e4a102d

@end

@implementation YrFirstInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
<<<<<<< HEAD
    for (int i = 1; i<=3; i++) {
        UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*(i-1), 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d%@",@"loading",i,@"_568h"]];
        [_scrollView addSubview:imageview];
    }
    
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*3, 0);
    _scrollView.pagingEnabled=YES;
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _pageControl.numberOfPages = 3;
    _button.userInteractionEnabled = NO;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int num = _scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    _pageControl.currentPage = num;
    _button.userInteractionEnabled = YES;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_scrollView.contentOffset.x>[UIScreen mainScreen].bounds.size.width*2) {
        //test
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YR" bundle:nil];
        AnimationViewController * test1 = [storyboard instantiateViewControllerWithIdentifier:@"an"];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = test1;
    }
}

#pragma mark - click button
- (IBAction)goToMainView:(UIButton *)sender {
    //need fix
    //only test
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YR" bundle:nil];
    AnimationViewController * test1 = [storyboard instantiateViewControllerWithIdentifier:@"an"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = test1;
}








=======
    
    
}

>>>>>>> 1cf7506efd2c46b1d4a6e01166e538897e4a102d
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

<<<<<<< HEAD

=======
>>>>>>> 1cf7506efd2c46b1d4a6e01166e538897e4a102d
@end
