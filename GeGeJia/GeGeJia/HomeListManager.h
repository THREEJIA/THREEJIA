//
//  HomeListManager.h
//  GeGeJia
//
//  Created by 孙诚 on 16/3/24.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BiggestModel.h"

@interface HomeListManager : NSObject

+ (void)getHomeList:(void(^)(BiggestModel *bigList)) completionHandler;

@end
