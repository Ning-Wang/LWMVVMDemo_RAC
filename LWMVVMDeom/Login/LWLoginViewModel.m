//
//  LWLoginViewModel.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWLoginViewModel.h"

@implementation LWLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUP];
    }
    return self;
}

- (void)setUP{
    @weakify(self);
    _LoginBtnEnabel = [RACSignal combineLatest:@[RACObserve(self,userName),RACObserve(self, passWord)] reduce:^id _Nonnull{
        @strongify(self);
        return @(self.userName.length >5 && self.passWord.length >5);
    }];
    
    _LoginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        NSLog(@"接收到登录参数 %@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            NSLog(@"这里做网络请求成功后跳转");
            //sendNext 也可以传返是否成功等
            [subscriber sendNext:input];
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                //销毁不需要的内容
            }];
        }];
    }];
}


@end
