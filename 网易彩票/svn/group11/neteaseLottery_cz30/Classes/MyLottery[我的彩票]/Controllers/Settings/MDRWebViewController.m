//
//  MDRWebViewController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRWebViewController.h"
#import "MDRHelp.h"

@interface MDRWebViewController () <UIWebViewDelegate>

@end

@implementation MDRWebViewController


- (void)loadView {
    
    self.view = [[UIWebView alloc] init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    MDRLog(@"%@", self.view);
    
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    
    // 创建本地url
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    // 设置关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    // 设置标题
    self.navigationItem.title = self.help.title;
}

- (void)close {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    MDRLog(@"加载完毕");
    // 加载完毕后跳转窗口
    
    NSString *script = [NSString stringWithFormat:@"window.location.href = '#%@'", self.help.ID];
    [webView stringByEvaluatingJavaScriptFromString:script];
}




@end
