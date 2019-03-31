//
//  ZJNavigationController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/20.
//

#import "ZJNavigationController.h"

@interface ZJNavigationController ()

@end

@implementation ZJNavigationController
//+ (void)load {
//    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//
//    // 只要是通过模型设置,都是通过富文本设置
//    // 设置导航条标题 => UINavigationBar
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
//    [navBar setTitleTextAttributes:attrs];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:80/255.0 green:186/255.0 blue:247/255.0 alpha:1.0]];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //    将导航栏进行统一的设置 必须是在调用push之前进行调用的
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIImage * backImage =  [UIImage imageNamed:@"about_back"];
        backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];

}
-(void)back {
    [self popViewControllerAnimated:YES];
}

@end
