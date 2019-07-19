//
//  LWListModel.h
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWListModel : NSObject

@property (nonatomic ,assign) long hotid;
@property (nonatomic ,copy) NSString * hotname;
@property (nonatomic ,copy) NSString * hotimg;

+ (instancetype)initWithDict:(NSDictionary *)dic;
- (instancetype)initWithDict:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
