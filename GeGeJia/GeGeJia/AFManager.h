//
//  AFManager.h
//  GeGeJia
//
//  Created by Mac on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFManager : NSObject


+ (void)getWithURL:(NSString  * _Nullable )urlStr parameters:(NSDictionary* _Nullable)parameters urlPath:(NSString* _Nullable)urlPath completionBlockHandler:(void(^)(id  _Nullable responseObject)) completionBlock;
+ (void)postWithURL:(NSString *)urlStr parameters:(NSDictionary *)parameters completionBlockHandler:(void(^)(id  _Nullable responseObject)) completionBlock;

@end
