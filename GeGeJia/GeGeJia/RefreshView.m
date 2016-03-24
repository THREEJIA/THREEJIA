//
//  RefreshView.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/23.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    if(self)
    {
        self.brandLogoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 174, 241)];
        self.brandLogoImageView.image = [UIImage imageNamed:@"brandLogo"];
        
        self.refreshImage = [[UIImageView alloc] initWithFrame:CGRectMake( 77, 241, 21,21)];
        self.refreshImage.image = [UIImage imageNamed:@"dragdown"];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(106, 241, 68, 21)];
        self.titleLabel.text = @"下拉刷新";
        _titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_brandLogoImageView];
        [self addSubview:_refreshImage];
        [self addSubview:_titleLabel];
    }
    
}

- (void)setFreshState:(FreshViewState)freshState
{
    _state = freshState;
    switch (_state)
    {
        case stateDragDown:
        {
            [_refreshImage.layer removeAllAnimations];
            _titleLabel.text = @"下拉刷新";
            _refreshImage.image = [UIImage imageNamed:@"dragdown"];
        }
            break;
        case stateReleaseFresh:
        {
            if ([_refreshImage.layer.animationKeys[0] isEqualToString:@"2"])
            {
                
            }
            else
            {
                [_refreshImage.layer removeAllAnimations];
                [self releaseAnimation];
            }
            _titleLabel.text = @"释放刷新";
            _refreshImage.image = [UIImage imageNamed:@"dragdown"];
        }
            break;
        case stateFreshing:
        {
            [_refreshImage.layer removeAllAnimations];
            _titleLabel.text = @"正在刷新...";
            _refreshImage.image = [UIImage imageNamed:@"loading_icon"];
            [self freshingAnimation];
        }
            break;

            
        default:
            break;
    }
}

- (void)dragDownAnimation
{
    
}

- (void)releaseAnimation
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI];
    rotationAnimation.duration = 0.2;
    
    rotationAnimation.cumulative = NO;
    rotationAnimation.repeatCount = 1;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    
    [_refreshImage.layer addAnimation:rotationAnimation forKey:@"2"];
}

- (void)freshingAnimation
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 1.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    
    [_refreshImage.layer addAnimation:rotationAnimation forKey:@"1"];
}

@end
