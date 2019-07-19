//
//  LWListTableViewCell.h
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface LWListTableViewCell : UITableViewCell

@property (nonatomic ,strong) LWCellViewModel * model;

@end

NS_ASSUME_NONNULL_END
