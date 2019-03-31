//
//  ZJHomeNewsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/31.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJHomeNewsCell.h"
#import "ZJNewsModel.h"

@interface ZJHomeNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

@implementation ZJHomeNewsCell

-(void)setModel:(ZJNewsModel *)model {
    _model = model;
    self.timeLable.text = model.time;
    self.titleLabel.text = model.title;
}

@end
