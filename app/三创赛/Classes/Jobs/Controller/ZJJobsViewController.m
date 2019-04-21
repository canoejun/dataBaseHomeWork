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
#import "ZJDetailInfoController.h"
#import "AFNetworking.h"


@interface ZJJobsViewController ()
/** 存放数据的数组  */
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ZJJobsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://192.168.43.198:8080/springmvc_project/getAllJobs" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        self.dataArray = [ZJJobsModel mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    self.navigationItem.title = @"校园招聘";
    UIImageView * searchBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchJobInfo:)];
    [searchBtn addGestureRecognizer:tap];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
//    自适应高度
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 80;
}


-(void)searchJobInfo:(UITapGestureRecognizer *)sender {
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
        cell = [[ZJJobsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    ZJJobsCell *cell = (ZJJobsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    ZJDetailInfoController * infoVc = [[ZJDetailInfoController alloc] init];
    [infoVc setUrl:cell.model.url];
    [infoVc setWorkTitle:@"职位介绍"];
    [self.navigationController pushViewController:infoVc animated:YES];
}

@end
