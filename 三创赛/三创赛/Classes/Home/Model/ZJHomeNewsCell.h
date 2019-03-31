//
//  ZJHomeNewsCell.h
//  三创赛
//
//  Created by 张俊 on 2019/3/31.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZJNewsModel;
@interface ZJHomeNewsCell : UITableViewCell
/** 模型数据  */
@property (nonatomic,strong) ZJNewsModel * model;
@end

NS_ASSUME_NONNULL_END
