//
//  ZJMineTableViewCell.h
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZJMineModel;

@interface ZJMineTableViewCell : UITableViewCell
/** cell的模型  */
@property (nonatomic,copy) ZJMineModel * ZJMine;
@end

NS_ASSUME_NONNULL_END
