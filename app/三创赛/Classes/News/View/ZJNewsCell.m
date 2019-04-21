//
//  ZJNewsCell.m
//  三创赛
//
//  Created by 张俊 on 2019/3/30.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJNewsCell.h"
#import "ZJNewsModel.h"
#import "AFNetworking.h"

@interface ZJNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *mediaLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

@end

@implementation ZJNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setModel:(ZJNewsModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.mediaLabel.text = model.media;
    self.timeLabel.text = model.time;
    __block UIImage * image;
//    如果有图片链接就显示，否则显示自己的
    if (model.pictureUrl.length > 0) {
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [[AFHTTPResponseSerializer alloc]init];
        [manager GET:[NSString stringWithFormat:@"https:%@",model.pictureUrl] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            image = [UIImage imageWithData:responseObject];
            self.newsImageView.image = image;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }else {
        self.newsImageView.image = [UIImage imageNamed:@"new1"];
    }

    
    
}

@end
