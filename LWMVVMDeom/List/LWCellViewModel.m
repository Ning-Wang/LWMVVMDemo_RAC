//
//  LWCellViewModel.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/17.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWCellViewModel.h"
#import "LWListModel.h"

@implementation LWCellViewModel

+ (instancetype)initWithModel:(LWListModel *)listModel{
    
    LWCellViewModel * cellModel = [[self alloc] init];
    cellModel.hotid = listModel.hotid;
    cellModel.hotimg = listModel.hotimg;
    cellModel.hotname = listModel.hotname;
    
    return cellModel;
}

@end
