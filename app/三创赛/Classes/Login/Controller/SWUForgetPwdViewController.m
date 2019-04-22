//
//  SWUForgetPwdViewController.m
//  OpenSwuNG
//
//  Created by 张俊 on 2019/3/1.
//

#import "SWUForgetPwdViewController.h"
#import "Constants.h"
#import "UIButton+Login.h"
#import "SWUTextField.h"
#import "SWULoginLabel.h"
#import "SVProgressHUD.h"
#import "SWUVerificationCodeButton.h"
#import "AFNetworking.h"
#import "ZJLoginSuccessModel.h"
#import "MJExtension.h"

@interface SWUForgetPwdViewController ()
/** 手机号  */
@property (nonatomic,strong) SWUTextField * userPhoneNumber;
/** 第一次密码  */
@property (nonatomic,strong) SWUTextField * firstPwd;
/** 第二次密码  */
@property (nonatomic,strong) SWUTextField * secondPwd;
/** 确认修改密码  */
@property (nonatomic,strong) UIButton * confirmBtn;
/** 网络请求传递的参数  */
@property (nonatomic,strong) NSDictionary * paraDic;
@end

@implementation SWUForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self setUpUI];
}

-(void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    //    绑定校园卡
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVA_MAXY+10, SCREEN_WIDTH, 220)];
    [self.view addSubview:backView];
    int i = 0;
    SWULoginLabel * phoneLabel = [SWULoginLabel SWULoginLabelwithText:@"手机号"];
    self.userPhoneNumber = [SWUTextField SWUTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:phoneLabel Text:@"请输入手机号码" KeyBoardType:UIKeyboardTypeNumberPad];
    //    设置底部的线条
    [_userPhoneNumber setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _userPhoneNumber.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _userPhoneNumber];
    i++;
    
    SWULoginLabel * firstPwdLabel = [SWULoginLabel SWULoginLabelwithText:@"密码"];
    self.firstPwd = [SWUTextField SWUTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:firstPwdLabel Text:@"请输入新密码" KeyBoardType:UIKeyboardTypeDefault];
    _firstPwd.secureTextEntry = YES;
    //    设置底部的线条
    [_firstPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _firstPwd.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    [backView addSubview: _firstPwd];
    i++;
    
    SWULoginLabel * secondPwdLabel  = [SWULoginLabel SWULoginLabelwithText:@"确认密码"];
    self.secondPwd = [SWUTextField SWUTextFieldWithFrame:CGRectMake(0, i*(WEEK_SCROLLERVIEW_HEIGHT+10), SCREEN_WIDTH, WEEK_SCROLLERVIEW_HEIGHT) LeftView:secondPwdLabel Text:@"请再次输入新密码" KeyBoardType:UIKeyboardTypeDefault];
    [_secondPwd setLineViewLength:CGRectMake(SCREEN_WIDTH*0.05, _secondPwd.frame.size.height, SCREEN_WIDTH*0.9, 0.5)];
    _secondPwd.secureTextEntry = YES;
    [backView addSubview: _secondPwd];
    
    //    添加确认按钮
    self.confirmBtn = [UIButton ButtonWithTitle:@"确认" Frame:CGRectMake(SCREEN_WIDTH*0.05, CGRectGetMaxY(backView.frame)+30,SCREEN_WIDTH*0.9, 40) Alignment:UIControlContentHorizontalAlignmentCenter titleColor:[UIColor whiteColor]];
    _confirmBtn.backgroundColor = [UIColor colorWithRed:24/255.0 green:113/255.0 blue:245/255.0 alpha:1.0];
    [_confirmBtn addTarget:self action:@selector(confirmModify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmBtn];
    
}
- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}
//确认修改按钮
-(void)confirmModify {
    
    //    判断两次的密码是否相同
    if (_firstPwd.text.length <= 0 ||  _secondPwd.text.length <= 0 ) {
        [SVProgressHUD showErrorWithStatus:@"密码为空，请输入"];
        return;
    }
    if (![_firstPwd.text isEqualToString:_secondPwd.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
    }
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    self.paraDic = @{
                     @"phoneNumber":_userPhoneNumber.text,
                     @"password":_firstPwd.text
                     };
    [manager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"acToken"] forHTTPHeaderField:@"acToken"];
    [manager POST:@"http://192.168.43.198:8080/springmvc_project/changePassword" parameters:_paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        ZJLoginSuccessModel * loginModel = [ZJLoginSuccessModel mj_objectWithKeyValues:responseObject];
        if (![loginModel.code isEqualToString:@"ok"]) {
            [SVProgressHUD showErrorWithStatus:@"修改失败，请确认账号!"];
            return ;
        }
        [SVProgressHUD showSuccessWithStatus:@"修改成功!"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
        NSString *string =[[NSString alloc]initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding];

        NSLog(@"%@",string);
        [SVProgressHUD showErrorWithStatus:@"请检查网络，稍后重试!"];
    }];
}



@end
