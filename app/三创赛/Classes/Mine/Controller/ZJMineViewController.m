//
//  ZJMineViewController.m
//  OpenZJNG
//
//  Created by 张俊 on 2019/2/16.
//

#import "ZJMineViewController.h"
#import "ZJMineModel.h"
#import "ZJMineTableViewCell.h"
#import "ZJNavigationController.h"
#import "MJExtension.h"
#import "ZJHeaderView.h"
#import "ZJPublishJobsViewController.h"
#import "SWULoginViewController.h"
#import "ZJDelteUserViewController.h"


@interface ZJMineViewController ()
/** 模型数组  */
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation ZJMineViewController

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray  = [ZJMineModel mj_objectArrayWithFilename:@"Mine.plist"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    //    清除多余的cell
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.separatorColor = [UIColor lightGrayColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(7, 15, 7, 15);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * ID = @"Mine";
    
    ZJMineTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZJMineTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.ZJMine = self.dataArray[indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZJHeaderView * view = [[ZJHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeName:)];
    [view addGestureRecognizer:tapGeture];
    return  view;
}

-(void)changeName:(UITapGestureRecognizer *)tap {
    ZJDelteUserViewController * deleteVc = [[ZJDelteUserViewController alloc] init];
    [self.navigationController pushViewController:deleteVc animated:YES];
}

#pragma mark ------ TableViewDelegate ------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ZJMineModel * ZJMine = self.dataArray[indexPath.row];
    [self showAlertViewtableView:tableView ZJMine:ZJMine];
}
//显示alertView
-(void)showAlertViewtableView:(UITableView *)tableView ZJMine:(ZJMineModel *)ZJMine {
    NSInteger count = ZJMine.count.integerValue;
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:NULL message:ZJMine.information preferredStyle:UIAlertControllerStyleAlert];
    if (count == 2) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:cancelAction];
    }
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([ZJMine.icon isEqualToString:@"mine_tuisong"]) {
            [userDefaults setObject:@"" forKey:@"phoneNumber"];
            [userDefaults setObject:@"" forKey:@"password"];
            [userDefaults synchronize];
            //                退出登录，然后设置主页面为登录界面
            SWULoginViewController * loginVc = [[SWULoginViewController alloc] init];
            ZJNavigationController * nav = [[ZJNavigationController alloc] initWithRootViewController:loginVc];
            [[UIApplication sharedApplication].keyWindow setRootViewController:nav];
            return;
        }
    }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
