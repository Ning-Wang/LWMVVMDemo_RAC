//
//  LWLoginViewModel.h
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWLoginViewModel : NSObject

@property (nonatomic , copy) NSString * userName;
@property (nonatomic , copy) NSString * passWord;
@property (nonatomic , strong) RACSignal * LoginBtnEnabel;
@property (nonatomic , strong) RACCommand * LoginCommand;


@end

NS_ASSUME_NONNULL_END
