//
//  SockView.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/24.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "SockView.h"

@implementation SockView

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
//    CGRect rect = self.frame;
    UIView *view = nil;
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"SockView" owner:self options:nil];
    for (id object in objects)
    {
        if ([object isKindOfClass:[UIView class]])
        {
            view = object;
            break;
        }
    }
    
    if (view)
    {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.clipsToBounds = YES;
//        view.bounds = CGRectMake(0, 108, WWWW, HHHH - 157);
        [self addSubview:view];
        
    }
}








@end
