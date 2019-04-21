//
//  ZJProgressLineView.h
//  三创赛
//
//  Created by 张俊 on 2019/4/21.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJProgressLineView : UIView
- (void)startLoadingAnimation;
- (void)endLoadingAnimation;
-(void)setLineColor:(UIColor *)lineColor;
@end

NS_ASSUME_NONNULL_END
