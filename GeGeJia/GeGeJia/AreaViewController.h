//
//  AreaViewController.h
//  GeGeJia
//
//  Created by 孙诚 on 16/3/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView         *headerView;
@property (weak, nonatomic) IBOutlet UITableView    *areaTableView;

- (IBAction)dismissButtonClick:(UIButton *)sender;
@end
