//
//  ZJJobsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsCell.h"
#import "ZJJobsModel.h"
#import "Masonry.h"

@interface ZJJobsCell ()
/** 工作  */
@property (nonatomic,strong) UILabel *workLabel;
/** 城市  */
@property (nonatomic,strong) UILabel *cityLabel;
/** 人数  */
@property (nonatomic,strong) UILabel *peopleCountLabel;
/** 发布时间  */
@property (nonatomic,strong) UILabel *timeLabel;
@end

@implementation ZJJobsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return  self;
}

-(void)setUpUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.workLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    _workLabel.text = @"测试";
    _workLabel.textColor = [UIColor colorWithRed:46/255.0 green:92/255.0 blue:164/255.0 alpha:1.0];
    [self addSubview:_workLabel];
    
    CGFloat cityHeight = 15;
    
    UIView *cityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.4, cityHeight)];
    cityView.backgroundColor = [UIColor redColor];
    UIImageView *cityImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city"]];
    cityImageView.frame = CGRectMake(0, 0, cityHeight, cityHeight);
    [cityView addSubview:cityImageView];
    self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityImageView.frame), 0, cityView.frame.size.width - cityImageView.frame.size.width, cityHeight)];
    [cityView addSubview:_cityLabel];
    [self addSubview:cityView];
    
    UIView *peopleCountView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.4, cityHeight)];
    peopleCountView.backgroundColor = [UIColor purpleColor];
    UIImageView *peopleCountImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"people"]];
    peopleCountImageView.frame = CGRectMake(0, 0, cityHeight, cityHeight);
    [peopleCountView addSubview:peopleCountImageView];
    self.peopleCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(peopleCountImageView.frame), 0, peopleCountView.frame.size.width - peopleCountImageView.frame.size.width, cityHeight)];
    [peopleCountView addSubview:_peopleCountLabel];
    [self addSubview:peopleCountView];
    
    UIView *timeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.4, cityHeight)];
    timeView.backgroundColor = [UIColor grayColor];
    UIImageView *timeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"time"]];
    timeImageView.frame = CGRectMake(0, 0, cityHeight, cityHeight);
    [timeView addSubview:timeImageView];
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timeImageView.frame), 0, timeView.frame.size.width - timeImageView.frame.size.width, cityHeight)];
    [timeView addSubview:_timeLabel];
    [self addSubview:timeView];
    
//    布局
    [_workLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(5);
    }];
    [cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.workLabel);
        make.top.equalTo(self.workLabel.mas_bottom).offset(10);
    }];
    [peopleCountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(self.frame.size.width*0.4);
        make.top.equalTo(cityView);
    }];
    [timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.workLabel);
        make.top.equalTo(cityView.mas_bottom).offset(25);
    }];
}



-(void)setModel:(ZJJobsModel *)model {
    _model = model;
    _workLabel.text = model.work;
    _cityLabel.text = model.city;
    _peopleCountLabel.text = model.recruits_number;
    _timeLabel.text = model.time;
}


@end
