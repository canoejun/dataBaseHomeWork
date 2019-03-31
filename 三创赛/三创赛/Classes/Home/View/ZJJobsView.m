//
//  ZJJobsView.m
//  三创赛
//
//  Created by 张俊 on 2019/3/26.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsView.h"
#import "ZJHomeJobsCell.h"

@implementation ZJJobsView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI:frame];
    }
    return self;
}
-(void)setUpUI:(CGRect)frame {
    NSArray * dataArray = @[
                            @{
                                @"icon":@"qiye",
                                @"name":@"企业兼职"
                                },
                            @{
                                @"icon":@"shangdian",
                                @"name":@"商店兼职"
                                },
                            @{
                                @"icon":@"gongchang",
                                @"name":@"工厂兼职"
                                },
                            @{
                                @"icon":@"daili",
                                @"name":@"校园代理"
                                },
                            @{
                                @"icon":@"chaundan",
                                @"name":@"发传单"
                                },
                            @{
                                @"icon":@"jiajiao",
                                @"name":@"家教"
                                },
                            @{
                                @"icon":@"qita",
                                @"name":@"其他"
                                }
                            ];
    CGFloat cellHeight = (frame.size.height - 20) * 0.5;
    CGFloat padding = 30;
    CGFloat cellWidth = (frame.size.width-8*padding) / 4.0;
    int count = 0;
    for (int j = 0; j < 2 ; j++) {
        for (int i = 0; i < 4 &&  count < dataArray.count ; i++) {
            NSDictionary * dataDic = dataArray[count++];
            ZJHomeJobsCell * view  = [ZJHomeJobsCell ZJHomeJobsCellWithName:dataDic[@"name"] image:[UIImage imageNamed:dataDic[@"icon"]] frame:CGRectMake(padding +(cellWidth+2*padding)*i, (cellHeight+20) * j, cellWidth, cellHeight)];
            [self addSubview:view];
            
        }
    }
}



@end
