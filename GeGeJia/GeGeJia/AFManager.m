//
//  AFManager.m
//  GeGeJia
//
//  Created by Mac on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "AFManager.h"

#import <AFNetworking.h>

@interface AFManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation AFManager

+ (void)getWithURL:(NSString *)urlStr parameters:(NSString *)paramsStr completionBlockHandler:(void(^)(NSDictionary *responseDic, NSError *error)) completionBlock
{
    
}


- (void)createManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
    });
}

@end
