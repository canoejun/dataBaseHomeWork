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
#import "ZJDetailInfoController.h"
#import "AFNetworking.h"

@interface ZJNewsViewController ()
/** 存放数据的数组  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJNewsViewController
//-(NSArray *)dataArray {
//    if (!_dataArray) {
//        _dataArray = [ZJNewsModel mj_objectArrayWithFilename:@"news.plist"];
//    }
//    return _dataArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://192.168.43.198:8080/springmvc_project/getAllNews" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        self.dataArray = [ZJNewsModel mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
        //        NSLog(@"回调里面%@",self.dataArray);
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    self.navigationItem.title = @"新闻资讯";
    self.tableView.rowHeight = 80;
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
    ZJNewsCell *cell = (ZJNewsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    ZJDetailInfoController * infoVc = [[ZJDetailInfoController alloc] init];
    [infoVc setUrl:cell.model.url];
    [infoVc setWorkTitle:@"详情"];
    [self.navigationController pushViewController:infoVc animated:YES];
}

@end
