//
//  ZJMineTableViewCell.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/19.
//

#import "ZJMineTableViewCell.h"
#import "ZJMineModel.h"


@implementation ZJMineTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

-(void)setZJMine:(ZJMineModel *)ZJMine {
    _ZJMine = ZJMine;
    self.imageView.image = [UIImage imageNamed:ZJMine.icon];
    self.textLabel.text = ZJMine.content;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, self.frame.size.height*0.6, self.frame.size.height*0.6);
    self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+12, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
}


@end
