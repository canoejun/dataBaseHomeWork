//
//  ZJTabBarController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/16.
//

#import "ZJTabBarController.h"
#import "ZJMainViewController.h"
#import "ZJMineViewController.h"
#import "ZJJobsViewController.h"
#import "ZJNavigationController.h"
#import "ZJNewsViewController.h"


@interface ZJTabBarController ()
/** 记录上一次点击的item  */
@property (nonatomic,assign) NSInteger  passIndex;
@end

@implementation ZJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.alpha = 1.0;
    self.passIndex = 0;
    //    1.添加子控制器
    [self setupAllChildViewController];
    
    //    解决返回时 tabbar的卡顿问题
    [UITabBar appearance].translucent = NO;
    
}
-(void)setupAllChildViewController {
    //    子控制器
    //    主页
    ZJMainViewController * mainVc = [[ZJMainViewController alloc] init];
    
    ZJNavigationController * nav = [[ZJNavigationController alloc] initWithRootViewController:mainVc];
    [self setupOneChildViewController:nav image:[UIImage imageNamed:@"tabBar_home_icon"] selImage:[UIImage imageNamed:@"tabBar_home_click_icon"] title:@"主页"];
    //    寻找兼职
    ZJJobsViewController * jobsVc = [[ZJJobsViewController alloc] init];
    ZJNavigationController * nav1 = [[ZJNavigationController alloc] initWithRootViewController:jobsVc];
    [self setupOneChildViewController:nav1 image:[UIImage imageNamed:@"tabBar_jobs_icon"] selImage:[UIImage imageNamed:@"tabBar_jobs_click_icon"] title:@"找兼职"];
    //企业新闻
    ZJNewsViewController * newsVc = [[ZJNewsViewController alloc] init];
    ZJNavigationController * nav2 = [[ZJNavigationController alloc] initWithRootViewController:newsVc];
    [self setupOneChildViewController:nav2 image:[UIImage imageNamed:@"tabBar_news_icon"] selImage:[UIImage imageNamed:@"tabBar_news_click_icon"] title:@"企业资讯"];
    
    //    我的
    ZJMineViewController * mineVc = [[ZJMineViewController alloc] init];
    ZJNavigationController * nav3 = [[ZJNavigationController alloc] initWithRootViewController:mineVc];
    [self setupOneChildViewController:nav3 image:[UIImage imageNamed:@"tabBar_mine_icon"] selImage:[UIImage imageNamed:@"tabBar_mine_click_icon"] title:@"我的"];
}


//初始化一个控制器的View
-(void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title {
    [self addChildViewController:vc];
    vc.tabBarItem.image = image;
    
    //    防止tabbar进行渲染
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selImage;
    vc.tabBarItem.title = title;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != _passIndex) {
        NSMutableArray * array = [NSMutableArray array];
        for (UIView * item in self.tabBar.subviews) {
            if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [array addObject:item];
            }
        }
        UIView * item = [array objectAtIndex:index];
        [UIView animateWithDuration:0.2 animations:^{
            item.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                item.transform = CGAffineTransformIdentity;
            }];
        }];
        _passIndex = index;
    }
}

@end
