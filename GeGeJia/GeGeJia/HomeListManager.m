//
//  HomeListManager.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/24.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "HomeListManager.h"
#import "AFNetworking.h"

@implementation HomeListManager

+ (void)getHomeList:(void(^)(BiggestModel *bigList)) completionHandler
{
    //构建会话配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //根据会话配置构建manager
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //设置manager的响应序列化类型
    //    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    NSDictionary *params = @{@"os":@"1", @"params":@"{\"type\":\"124569bc\"}", @"remark":@"isVestUpdate35", @"sign":@"1B373DC7B3649A16", @"version":@"2.48"};
    
    NSURLSessionDataTask *dataTask = [manager POST:@"http://app.gegejia.com/yangege/appNative/resource/homeList" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSLog(@"_______%@", responseObject);
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSMutableString *responseString = [NSMutableString stringWithString:dic[@"params"]];
        NSString *character = nil;
        for (int i = 0; i < responseString.length; i ++) {
            character = [responseString substringWithRange:NSMakeRange(i, 1)];
            if ([character isEqualToString:@"\\"])
                [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
        }
        //        NSLog(@"responseString___%@", responseString);
        //解析字符串
        NSError *error = nil;
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
        
        if (!error)
        {
            BiggestModel *bigList = [BiggestModel new];
            [bigList setValuesForKeysWithDictionary:dataDic];
            completionHandler(bigList);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    [dataTask resume];
}

@end
