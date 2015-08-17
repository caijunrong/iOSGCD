//
//  AFNetUtil.h
//  App_Swift
//
//  Created by biyabi on 15/7/15.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface AFNetUtil : AFHTTPSessionManager
+(instancetype) sharedClient;
@end
