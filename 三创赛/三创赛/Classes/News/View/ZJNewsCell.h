//
//  ZJNewsCell.h
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJNewsModel;
NS_ASSUME_NONNULL_BEGIN

@interface ZJNewsCell : UITableViewCell
/** 模型数据  */
@property (nonatomic,strong) ZJNewsModel * model;
@end

NS_ASSUME_NONNULL_END
