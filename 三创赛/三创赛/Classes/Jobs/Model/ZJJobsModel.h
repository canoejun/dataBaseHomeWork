//
//  ZJJobsModel.h
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJJobsModel : NSObject
/** 公司  */
@property (nonatomic,copy) NSString * company;
/** 地理位置  */
@property (nonatomic,copy) NSString * location;
/** 工资  */
@property (nonatomic,copy) NSString * money;
/** 做什么  */
@property (nonatomic,copy) NSString * position;
/** 时间  */
@property (nonatomic,copy) NSString * time;
@end

NS_ASSUME_NONNULL_END
