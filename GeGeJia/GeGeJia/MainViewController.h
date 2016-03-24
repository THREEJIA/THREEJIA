//
//  ViewController.h
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BiggestModel.h"
#import "HomeListManager.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollerView;

@property (nonatomic, strong) NSMutableArray *titleNameArr;

//@property (nonatomic, copy) void (^bigListBlock)(BiggestModel *);
@property (nonatomic, copy) NSString *areaString;
@property (weak, nonatomic) IBOutlet UIButton *areaButton;

- (IBAction)locationButtonClick:(UIButton *)sender;
- (IBAction)searchButtonClick:(UIButton *)sender;

@end

