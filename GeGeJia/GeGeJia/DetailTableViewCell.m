//
//  DetailTableViewCell.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    
    
}

- (void)creatButtons:(NSInteger)totalNum
{
    
    float width = (self.bounds.size.width-3)/4.0;
    float height = (self.bounds.size.height-3)/3.0;
    
    for (int i = 0; i < totalNum ; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.bounds.size.width/4.0 * (i%4), self.bounds.size.height/3.0 * (i/4) + 1 , width, height);
        btn.tag = i + 100;
        
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.text = [NSString stringWithFormat:@"%ld",(long)btn.tag];
        
        [self addSubview:btn];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
