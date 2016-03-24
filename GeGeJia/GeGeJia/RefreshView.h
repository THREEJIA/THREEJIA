//
//  RefreshView.h
//  GeGeJia
//
//  Created by 孙诚 on 16/3/23.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    stateDragDown,
    stateReleaseFresh,
    stateFreshing,
} FreshViewState;

@interface RefreshView : UIView

@property (strong, nonatomic) UIImageView *refreshImage;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *brandLogoImageView;

@property (nonatomic, assign) FreshViewState state;
@property (nonatomic, assign) BOOL isDragging;
@property (nonatomic, assign) BOOL isAnimation;


- (void)setFreshState:(FreshViewState)freshState;
- (void)dragDownAnimation;
- (void)releaseAnimation;

@end
