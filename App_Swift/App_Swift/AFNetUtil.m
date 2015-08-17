//
//  AFNetUtil.m
//  App_Swift
//
//  Created by biyabi on 15/7/15.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "AFNetUtil.h"

@interface AFNetUtil()

@end

@implementation AFNetUtil
+(instancetype) sharedClient{
    static AFNetUtil *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[self alloc]init];
    });
    
    return _shareClient;
}

-(instancetype)init{

    NSString *URLString = @"211.151.52.185";
    self = [super initWithBaseURL:[NSURL URLWithString:URLString]];
    
    return  self;
}
@end
