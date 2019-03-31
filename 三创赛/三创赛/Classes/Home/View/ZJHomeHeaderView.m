//
//  ZJHomeHeaderView.m
//  三创赛
//
//  Created by 张俊 on 2019/3/27.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJHomeHeaderView.h"
#import "ZJJobsView.h"

@implementation ZJHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI:frame];
    }
    return self;
}

-(void)setUpUI:(CGRect)frame {
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg"]];
    imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height*0.6);
    [self addSubview:imageView];

    ZJJobsView * jobsView = [[ZJJobsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, frame.size.width, frame.size.height-imageView.frame.size.height-10)];
    [self addSubview:jobsView];
}
@end
