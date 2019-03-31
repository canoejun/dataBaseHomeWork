//
//  ZJNewsViewController.m
//  三创赛
//
//  Created by 张俊 on 2019/3/26.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJNewsViewController.h"
#import "ZJNewsModel.h"
#import "MJExtension.h"
#import "ZJNewsCell.h"

@interface ZJNewsViewController ()
/** 存放数据的数组  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJNewsViewController
-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [ZJNewsModel mj_objectArrayWithFilename:@"news.plist"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"企业资讯";
//    self.tableView.separatorStyle
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * ID = @"news";
    ZJNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ZJNewsCell" owner:nil options:nil].firstObject;
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
