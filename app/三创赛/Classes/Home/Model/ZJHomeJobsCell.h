//
//  ZJHomeJobsCell.h
//  三创赛
//
//  Created by 张俊 on 2019/3/26.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJHomeJobsCell : UIView
+(ZJHomeJobsCell*)ZJHomeJobsCellWithName:(NSString *)name
                                   image:(UIImage *)image
                                   frame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
