//
//  ZJJobsViewController.m
//  三创赛
//
//  Created by 张俊 on 2019/3/26.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJJobsViewController.h"
#import "MJExtension.h"
#import "ZJJobsModel.h"
#import "ZJJobsCell.h"
#import "ZJJobHeadView.h"
#import "Constants.h"
#import "ZJJobsSearchViewController.h"

@interface ZJJobsViewController ()
/** 存放数据的数组  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJJobsViewController
-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [ZJJobsModel mj_objectArrayWithFilename:@"jobs.plist"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"找兼职";
    UIImageView * searchBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchJobInfo:)];
    [searchBtn addGestureRecognizer:tap];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
}
-(void)searchJobInfo:(UITapGestureRecognizer *)sender {
//    ZJJobsSearchViewController *searchVc = [[ZJJobsSearchViewController alloc] initWithNibName:@"ZJJobsSearchViewController" bundle:[NSBundle mainBundle]];
    ZJJobsSearchViewController *searchVc = [[ZJJobsSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * ID = @"jobs";
    ZJJobsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZJJobsCell" owner:nil options:nil] lastObject];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZJJobHeadView * headView = [[ZJJobHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
