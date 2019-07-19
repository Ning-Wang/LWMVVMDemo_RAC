//
//  LWListViewModel.h
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LWCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface LWListViewModel : NSObject

@property (nonatomic ,strong) NSMutableArray<LWCellViewModel *> *dataSource;

@end

NS_ASSUME_NONNULL_END
