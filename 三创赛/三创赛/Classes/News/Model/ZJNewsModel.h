//
//  ZJNewsModel.h
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJNewsModel : NSObject
/** 标题  */
@property (nonatomic,copy) NSString * title;
/** 时间  */
@property (nonatomic,copy) NSString * time;
/** 图片名称  */
@property (nonatomic,copy) NSString * image;

@end

NS_ASSUME_NONNULL_END
