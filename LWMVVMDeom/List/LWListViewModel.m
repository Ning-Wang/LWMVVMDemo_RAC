//
//  LWListViewModel.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWListViewModel.h"
#import "LWListModel.h"
#import "LWCellViewModel.h"

typedef void(^SuccessBlock)(id  __nullable response);
typedef void(^failureBlock)(NSError * _Nullable  error);

@interface LWListViewModel ()


@end

@implementation LWListViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self setUP];
    }
    return self;
}

- (void)setUP{
    
    [self getMusicListRequestSuccess:^(id  _Nullable response) {
        
        if (response) {
            NSArray * responseArr = (NSArray *)response;
            NSArray *flags = [[responseArr.rac_sequence map:^id(id value) {
                LWListModel * listModel =  [LWListModel initWithDict:value];
                
                return [LWCellViewModel initWithModel:listModel] ;
                
            }] array];
            self.dataSource = [NSMutableArray arrayWithArray:flags];
        }
        
    } failure:^(NSError * _Nullable error) {
        
    }];
    
}


- (void)getMusicListRequestSuccess:(SuccessBlock)success failure:(failureBlock)failure{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // Get请求
    [manager GET:@"http://application.gq.com.cn/mobileadmin/gq24/api/gethot?type=0" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        if (success) {
            success([self paramData:responseObject]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if (failure) {
            failure(error);
        }
        NSLog(@"%@", [error localizedDescription]);
    }];
    
}

- (NSArray *)paramData:(id)responseObject{
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    return  dic[@"hot"];
    
}


@end
