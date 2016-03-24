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

//@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation AFManager

+ (void)getWithURL:(NSString *)urlStr parameters:(NSDictionary*)parameters urlPath:(NSString*)urlPath completionBlockHandler:(void(^)(id  _Nullable responseObject)) completionBlock
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = requestSerializer;
    
    NSURLSessionDataTask *task = [manager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    [task resume];
}

+ (void)postWithURL:(NSString *)urlStr parameters:(NSDictionary*)parameters completionBlockHandler:(void(^)(id  _Nullable responseObject)) completionBlock
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSURLSessionDataTask * task = [manager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    [task resume];

}



+ (void)createManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //_manager = [AFHTTPSessionManager manager];
    });
}

@end
