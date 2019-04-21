//
//  ZJDetailInfoController.m
//  三创赛
//
//  Created by 张俊 on 2019/4/21.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJDetailInfoController.h"
#import "Constants.h"
#import "ZJProgressLineView.h"
#import "SVProgressHUD.h"
#import <WebKit/WebKit.h>

#define NAVA_MAXY (CGRectGetMaxY(self.navigationController.navigationBar.frame))

@interface ZJDetailInfoController ()<WKNavigationDelegate,WKUIDelegate>
/** url  */
@property (nonatomic, copy) NSString *url;
/** title  */
@property (nonatomic,copy) NSString *workTitle;
/** 进度条  */
@property (nonatomic,strong) ZJProgressLineView *progressLine;
/** webView  */
@property (nonatomic,strong) WKWebView *webView;
@end

@implementation ZJDetailInfoController

-(void)setUrl:(NSString *)url {
    _url = url;
}
- (void)setWorkTitle:(NSString *)workTitle {
    _workTitle = workTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.workTitle;
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    NSString * realUrl = _url;
    if (![_url containsString:@"https://"]) {
        realUrl = [NSString stringWithFormat:@"https://%@",_url];
    }
    NSLog(@"%@",realUrl);
    NSURL * url = [NSURL URLWithString:realUrl];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    _webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:_webView];
    
    
    
    
    self.progressLine = [[ZJProgressLineView alloc] initWithFrame:CGRectMake(0, NAVA_MAXY, SCREEN_WIDTH, 3)];
    self.progressLine.lineColor = [UIColor orangeColor];
    _progressLine.hidden = YES;
    [_webView addSubview:_progressLine];
}


-(void)viewDidDisappear:(BOOL)animated {
    [SVProgressHUD dismiss];
}

// 页面开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD showProgress:3 status:@"稍等,玩命加载中..."];
    [self.progressLine startLoadingAnimation];
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{//这里修改导航栏的标题，动态改变
    self.title = webView.title;
    [SVProgressHUD dismiss];
    [self.progressLine endLoadingAnimation];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
    [self.progressLine endLoadingAnimation];
}

-(void)backNative{
    //判断是否有上一层H5页面
    if (self.webView.canGoBack == YES) {
        //返回上级页面
        [self.webView goBack];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
