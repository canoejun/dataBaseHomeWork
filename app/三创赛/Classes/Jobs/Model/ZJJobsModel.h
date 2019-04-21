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
/** 城市  */
@property (nonatomic, copy) NSString *city;
/** 公司  */
@property (nonatomic,copy) NSString *company;
/** 需求人数  */
@property (nonatomic,copy) NSString *recruits_number;
/** 要求  */
@property (nonatomic,copy) NSString *request;
/** 发布时间  */
@property (nonatomic,copy) NSString *time;
/** 详情网址  */
@property (nonatomic,copy) NSString *url;
/** 工作  */
@property (nonatomic,copy) NSString *work;
@end

NS_ASSUME_NONNULL_END
