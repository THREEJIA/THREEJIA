//
//  MiddleModel.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "MiddleModel.h"

@implementation MiddleModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.bigId = value;
    }
}

@end
