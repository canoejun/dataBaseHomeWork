//
//  ZJJobsSearchViewController.m
//  三创赛
//
//  Created by 张俊 on 2019/3/31.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsSearchViewController.h"

@interface ZJJobsSearchViewController ()

@end

@implementation ZJJobsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 44)];
    UITextField * textFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 3, 240, 35)];
    textFiled.placeholder = @"日结工资";
    [titleView addSubview:textFiled];
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textFiled.frame), 240, 1)];
    lineView.backgroundColor = [UIColor darkGrayColor];
    [titleView addSubview:lineView];
    self.navigationItem.titleView = titleView;
    
    
    UILabel * rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, 27)];
    rightLabel.text = @"search";
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.backgroundColor = [UIColor colorWithRed:31/255.0 green:124/255.0 blue:246/255.0 alpha:1.0];
    rightLabel.layer.cornerRadius = rightLabel.frame.size.height * 0.4;
    rightLabel.layer.masksToBounds = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
    
    
}

@end
