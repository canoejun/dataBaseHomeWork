//
//  ZJMainViewController.m
//  OpenZJNG
//
//  Created by 501 on 2019/2/16.
//

#import "ZJMainViewController.h"
#import "ZJJobsView.h"
#import "ZJHomeHeaderView.h"
#import "Constants.h"
#import "ZJNewsModel.h"
#import "MJExtension.h"
#import "ZJHomeNewsCell.h"
#import "ZJHomeJobsCell.h"
#import "ZJJobsViewController.h"
#import "ZJDetailInfoController.h"


@interface ZJMainViewController () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
/** 滚动界面  */
@property (nonatomic,strong) UITableView * tableView;
/** 存放数据的数组  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJMainViewController
-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [ZJNewsModel mj_objectArrayWithFilename:@"news.plist"];
    }
    return _dataArray;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * ID = @"homeCell";
    ZJHomeNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZJHomeNewsCell" owner:nil options:nil] lastObject];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZJHomeHeaderView * headerView = [[ZJHomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.5)];
    for (UIView * view in headerView.subviews) {
        if ([view isKindOfClass:[ZJJobsView class]]) {
            for (UIView * cellView in view.subviews ) {
                if ([cellView isKindOfClass:[ZJHomeJobsCell class]]) {
                    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeInfonVC:)];
                    [cellView addGestureRecognizer:tap];
                }
            }
        }
    }
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SCREEN_HEIGHT * 0.5;
}
-(void)changeInfonVC:(UITapGestureRecognizer *)sender {
    for (UIView * view in sender.view.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            ZJJobsViewController * jobsVc = [[ZJJobsViewController alloc] init];
            jobsVc.navigationItem.title = @"企业兼职";
            [self.navigationController pushViewController:jobsVc animated:YES];
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ZJHomeNewsCell *cell = (ZJHomeNewsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    ZJDetailInfoController * infoVc = [[ZJDetailInfoController alloc] init];
    [infoVc setUrl:cell.model.url];
    [infoVc setWorkTitle:@"详情"];
    [self.navigationController pushViewController:infoVc animated:YES];
}

@end

