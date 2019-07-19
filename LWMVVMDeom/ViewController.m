//
//  ViewController.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/15.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "ViewController.h"
#import "LWLoginViewModel.h"
#import "LWListViewController.h"


@interface ViewController ()

@property (nonatomic ,strong) UITextField *nameTextF;
@property (nonatomic ,strong) UITextField *passWordTextF;

@property (nonatomic ,strong) UIButton * loginBtn;
@property (nonatomic ,strong) LWLoginViewModel * loginVM;

@end

@implementation ViewController

- (void)dealloc{
    NSLog(@"ViewController dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
    [self setUpData];
}

- (void)setUpData{
    
    RAC(self.loginVM,userName) = _nameTextF.rac_textSignal;
    RAC(self.loginVM,passWord) = _passWordTextF.rac_textSignal;
    RAC(_loginBtn,enabled) = self.loginVM.LoginBtnEnabel;
    
    @weakify(self);
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.loginVM.LoginCommand execute:@{@"userName":self.nameTextF.text,@"passWord":self.passWordTextF.text}];
    }];
    
    [_loginVM.LoginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        LWListViewController * listVC = [[LWListViewController alloc]initWithNibName:@"LWListViewController" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:listVC animated:YES];
    }];
    
    [[_loginVM.LoginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
       
        if ([x boolValue]) {
            NSLog(@"LoginCommand 执行中");
        }else{
            NSLog(@"LoginCommand 执行结束");
        }
    }];
    
}

- (void)initUI{
    
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _nameTextF = [self creatTextField];
    _nameTextF.frame = CGRectMake(66, 190, 188, 40);
    [self.view addSubview:_nameTextF];
    
    _passWordTextF = [self creatTextField];
    _passWordTextF.frame = CGRectMake(66, 240, 188, 40);
    [self.view addSubview:_passWordTextF];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    _loginBtn.frame = CGRectMake(66, 300, 55, 44);
    [self.view addSubview:_loginBtn];
    
}

- (UITextField *)creatTextField{
    
    UITextField * textF = [[UITextField alloc] init];
    textF.backgroundColor = [UIColor lightGrayColor];
    return textF;
}

- (LWLoginViewModel *)loginVM{
    
    if(_loginVM == nil){
        _loginVM = [[LWLoginViewModel  alloc] init];
    }
    return _loginVM;
}


@end
