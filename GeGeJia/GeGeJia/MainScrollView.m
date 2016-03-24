//
//  MainScrollView.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/24.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "MainScrollView.h"

@implementation MainScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self baseInit];
    }
    return self;
}

- (void)baseInit
{
    for (int i = 0; i < 6 ; i ++ )
    {
        if (i == 0)
        {
#warning mark
        }
        else if (i > 0 && i < 4)
        {
#warning mark
        }
        else if (i == 4)
        {
#warning mark
        }
        else
        {
#warning mark
        }
    }
}
@end

















