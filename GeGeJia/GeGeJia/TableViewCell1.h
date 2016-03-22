//
//  TableViewCell1.h
//  GeGeJia
//
//  Created by lu on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell1 : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

- (IBAction)leftWay:(UIButton *)sender;
- (IBAction)rightWay:(UIButton *)sender;


@end
