//
//  LWCellViewModel.h
//  LWMVVMDeom
//
//  Created by xd on 2019/4/17.
//  Copyright © 2019年 lw. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LWListModel;

NS_ASSUME_NONNULL_BEGIN

@interface LWCellViewModel : NSObject

@property (nonatomic ,assign) long hotid;
@property (nonatomic ,copy) NSString * hotname;
@property (nonatomic ,copy) NSString * hotimg;

+ (instancetype)initWithModel:(LWListModel *)listModel;

@end

NS_ASSUME_NONNULL_END
