//
//  ZJDelteUserViewController.m
//  三创赛
//
//  Created by 张俊 on 2019/4/22.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJDelteUserViewController.h"
#import "SWULoginLabel.h"
#import "UIButton+Login.h"
#import "SWUTextField.h"
#import "Constants.h"
#import "AFNetworking.h"
#import "ZJLoginSuccessModel.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "SWULoginViewController.h"
#import "ZJNavigationController.h"

@interface ZJDelteUserViewController ()
/** 手机号  */
@property (nonatomic,strong) SWUTextField * userNametextField;
/** 确认修改密码  */
@property (nonatomic,strong) UIButton * deleteBtn;
@end

@implementation ZJDelteUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

-(void)setUpUI {
    self.navigationItem.title = @"注销";
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    SWULoginLabel * phoneLabel = [SWULoginLabel SWULoginLabelwithText:@"昵称："];
    self.userNametextField = [SWUTextField SWUTextFieldWithFrame:CGRectMake(0, (NAVA_MAXY+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:phoneLabel Text:@"JZGo小站" KeyBoardType:UIKeyboardTypeNumberPad];
    //    设置底部的线条
    [_userNametextField setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userNametextField.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    _userNametextField.userInteractionEnabled = NO;
    [self.view addSubview: _userNametextField];
    
    
    //    添加确认按钮
    self.deleteBtn = [UIButton ButtonWithTitle:@"注销" Frame:CGRectMake(SCREEN_WIDTH*0.05, CGRectGetMaxY(_userNametextField.frame)+70,SCREEN_WIDTH*0.9, 40) Alignment:UIControlContentHorizontalAlignmentCenter titleColor:[UIColor whiteColor]];
//    _deleteBtn.backgroundColor = [UIColor colorWithRed:24/255.0 green:113/255.0 blue:245/255.0 alpha:1.0];
    _deleteBtn.backgroundColor = [UIColor redColor];
    [_deleteBtn addTarget:self action:@selector(deleteUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteBtn];
}
-(void)deleteUser {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * paraDic = @{
                     @"phoneNumber":[userDefaults objectForKey:@"phoneNumber"],
                     @"password":[userDefaults objectForKey:@"password"]
                     };
    [manager POST:@"http://192.168.43.198:8080/springmvc_project/deleteUser" parameters:paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        注册后怎么办
        NSLog(@"%@",responseObject);
        ZJLoginSuccessModel * loginModel = [ZJLoginSuccessModel mj_objectWithKeyValues:responseObject];
        if (![loginModel.code isEqualToString:@"ok"]) {
            [SVProgressHUD showErrorWithStatus:@"发生错误!"];
            return ;
        }
        [SVProgressHUD showSuccessWithStatus:@"注销成功!"];
        [userDefaults setObject:@"" forKey:@"phoneNumber"];
        [userDefaults setObject:@"" forKey:@"password"];
        [userDefaults synchronize];
        //                退出登录，然后设置主页面为登录界面
        SWULoginViewController * loginVc = [[SWULoginViewController alloc] init];
        ZJNavigationController * nav = [[ZJNavigationController alloc] initWithRootViewController:loginVc];
        [[UIApplication sharedApplication].keyWindow setRootViewController:nav];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"请检查网络，稍后重试!"];
    }];
}


@end
