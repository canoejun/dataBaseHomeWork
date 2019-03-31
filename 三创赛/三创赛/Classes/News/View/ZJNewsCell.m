//
//  ZJNewsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJNewsCell.h"
#import "ZJNewsModel.h"

@interface ZJNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageNewView;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

@implementation ZJNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setModel:(ZJNewsModel *)model {
    _model = model;
    self.timeLable.text =  model.time;
    self.imageNewView.image = [UIImage imageNamed:model.image];
    self.titleLable.text = model.title;
}

@end
