//
//  LWListModel.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWListModel.h"

@implementation LWListModel

+ (instancetype)initWithDict:(NSDictionary *)dic{
    
    return [[LWListModel alloc] initWithDict:dic];
}

- (instancetype)initWithDict:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        // 给空值属性初始化
    }
    return self;
}



@end
