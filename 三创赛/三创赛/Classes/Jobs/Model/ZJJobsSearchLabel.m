//
//  ZJJobsSearchLabel.m
//  三创赛
//
//  Created by 张俊 on 2019/3/31.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsSearchLabel.h"

@implementation ZJJobsSearchLabel
-(void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithRed:239/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    self.layer.cornerRadius = self.frame.size.height * 0.5;
    self.textAlignment = NSTextAlignmentCenter;
    [self sizeToFit];
    self.layer.masksToBounds = YES;
}
@end
