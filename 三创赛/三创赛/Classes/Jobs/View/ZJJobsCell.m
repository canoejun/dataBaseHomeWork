//
//  ZJJobsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsCell.h"
#import "ZJJobsModel.h"

@interface ZJJobsCell ()
@property (weak, nonatomic) IBOutlet UILabel *infoLable;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation ZJJobsCell


-(void)setModel:(ZJJobsModel *)model {
    _model = model;
    self.infoLable.text = [NSString stringWithFormat:@"职位：%@ \n企业：%@\n地点：%@\n工作时间：%@",model.position,model.company,model.location,model.time];
    self.moneyLabel.text = [NSString stringWithFormat:@"薪资：%@元/天",model.money];
}


@end
