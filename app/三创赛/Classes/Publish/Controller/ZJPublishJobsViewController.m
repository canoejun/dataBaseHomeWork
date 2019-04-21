//
//  ZJPublishJobsViewController.m
//  三创赛
//
//  Created by 张俊 on 2019/4/9.
//  Copyright © 2019年 zhangjun. All rights reserved.
//

#import "ZJPublishJobsViewController.h"
#import "Masonry.h"

@interface ZJPublishJobsViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation ZJPublishJobsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布招聘信息";
    self.detailTextView.text = @"备注：";
    self.detailTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.detailTextView.layer.borderWidth = 0.5;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    textView.text = @"";
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (textView.text.length == 0) {
        textView.text = @"备注：";
    }
    return YES;
}


@end
