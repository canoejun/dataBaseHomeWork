//
//  ZJProgressLineView.m
//  三创赛
//
//  Created by 张俊 on 2019/4/21.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJProgressLineView.h"
#import "Constants.h"

@interface ZJProgressLineView ()
/** 颜色  */
@property (nonatomic,strong) UIColor *lineColor;
@end

@implementation ZJProgressLineView

-(void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    self.backgroundColor = _lineColor;
}

- (void)startLoadingAnimation {
    self.hidden = NO;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 0.0, self.frame.size.height);
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,SCREEN_WIDTH * 0.4, self.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
             weakSelf.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,SCREEN_WIDTH * 0.7, self.frame.size.height);
        }];
    }];
}

- (void)endLoadingAnimation {
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
         weakSelf.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,SCREEN_WIDTH, self.frame.size.height);
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}

@end
