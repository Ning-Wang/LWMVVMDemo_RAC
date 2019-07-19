//
//  LWListViewController.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWListViewController.h"
#import "LWListTableViewCell.h"
#import "LWListViewModel.h"
static NSString * const LWCellIdentiry = @"LWCellIdentiry";

@interface LWListViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listTabelView;

@property (nonatomic ,strong) LWListViewModel * listVM;

@end

@implementation LWListViewController

- (void)dealloc{
    NSLog(@"LWListViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpUI];
    [self loadData];

}

- (void)loadData{
    
    @weakify(self);
    //在开始RAC学习的时候，看了信号的创建、订阅与发送还有一些RAC的常用方法。我的开始的疑问是，这个信号如何能通过创建订阅发送，来组成一个完整的响应链来完成目标任务，看完也是一头雾水。在练习的过程中我也探索出了一个方法，
    //OC中KVO无法监听count的变化 监听会崩溃  skip:跳过arr初始化的第一次监听
    //一步一步的寻找发现RACObserve 返回的是信号RACSignal
    //#define RACObserve(TARGET, KEYPATH) _RACObserve(TARGET, KEYPATH)
    //
    //#define _RACObserve(TARGET, KEYPATH) \
    //({ \
    //__weak id target_ = (TARGET); \
    //[target_ rac_valuesForKeyPath:@keypath(TARGET, KEYPATH) observer:self]; \
    //})
    //    - (RACSignal *)rac_valuesForKeyPath:(NSString *)keyPath observer:(__weak NSObject *)observer;

    [[RACObserve(self.listVM,dataSource) skip:1] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.listTabelView reloadData];
    }];
    
}

- (void)setUpUI{
    self.navigationController.title = @"列表";
    
    [_listTabelView registerNib:[UINib nibWithNibName:@"LWListTableViewCell" bundle:nil] forCellReuseIdentifier:LWCellIdentiry];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listVM.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LWListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:LWCellIdentiry forIndexPath:indexPath];
    cell.model = self.listVM.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}

- (LWListViewModel *)listVM{
    
    if(_listVM == nil){
        _listVM = [[LWListViewModel  alloc] init];
    }
    return _listVM;
}



@end
