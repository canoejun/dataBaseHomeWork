//
//  ZJJobHeadView.m
//  三创赛
//
//  Created by 张俊 on 2019/3/31.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobHeadView.h"

@implementation ZJJobHeadView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI:frame];
    }
    return self;
}

-(void)setUpUI:(CGRect)frame {
    self.backgroundColor = [UIColor whiteColor];
    self.alpha = 1.0;
    NSArray * dataArray = @[@"类型",@"附近",@"综合榜",@"筛选"];
    CGFloat realWidth = frame.size.width / 4.0;
    for (int i = 0; i < dataArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setImage:[UIImage imageNamed:@"sanjiao"] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%@",dataArray[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i*realWidth, 0, realWidth, frame.size.height-2);
        [self addSubview:btn];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width-15, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.center = CGPointMake(self.center.x, lineView.center.y);
    [self addSubview:lineView];
}

@end
