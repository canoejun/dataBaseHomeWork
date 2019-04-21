//
//  ZJHomeJobsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/26.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJHomeJobsCell.h"

@implementation ZJHomeJobsCell
+(ZJHomeJobsCell*)ZJHomeJobsCellWithName:(NSString *)name
                                   image:(UIImage *)image
                                   frame:(CGRect)frame {
    ZJHomeJobsCell * view = [[ZJHomeJobsCell alloc] initWithFrame:frame];
//    添加图片
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-20);
    [view addSubview:imageView];
    
//    添加名称
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.size.height, frame.size.width+25, 20)];
    nameLabel.text = name;
    nameLabel.center = CGPointMake(imageView.center.x, nameLabel.center.y);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:nameLabel];
    
    return view;
}



@end
