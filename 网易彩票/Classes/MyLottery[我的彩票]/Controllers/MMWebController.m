//
//  MMWebController.m
//  网易彩票
//
//  Created by ios on 16/6/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMWebController.h"
#import "MMHelpModel.h"
@interface MMWebController ()<UIWebViewDelegate>

@end

@implementation MMWebController
- (void)loadView {
    
    self.view = [[UIWebView alloc] init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    // 创建本地url
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.model.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

    //设置标题
    self.navigationItem.title = self.model.title;
    //设置左边关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}
- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"加载完毕");
    // 加载完毕后跳转窗口
    
    NSString *script = [NSString stringWithFormat:@"window.location.href = '#%@'", self.model.ID];
    [webView stringByEvaluatingJavaScriptFromString:script];
}

@end
