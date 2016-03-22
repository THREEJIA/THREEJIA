//
//  YrFirstInViewController.h
//  GeGeJia
//
//  Created by Mac on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YrFirstInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)goToMainView:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
