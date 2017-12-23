//
//  LYWebVC.m
//  KuangJia1
//
//  Created by MrSong on 17/8/3.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "LYWebVC.h"

@interface LYWebVC ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation LYWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0 ,0 ,30 ,30)];
    [btn setBackgroundImage:[UIImage imageNamed:@"safari"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barButton;
    
    
    self.webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.webView];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:urlRequest];
    
    self.webView.delegate = self;
}

//safari打开
-(void)rightBarButtonClick:(UIButton *)sender{
    
    NSURL *url = [NSURL URLWithString:self.url];
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        
    }];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.title = [self getTitle];
    
}

//获取网站标题
- (NSString *)getTitle {
    NSString *str = [[NSString alloc]initWithFormat:@"document.title"];
    NSString *returnstr = [self.webView stringByEvaluatingJavaScriptFromString:str];
    if ([returnstr isEqualToString: @""]) {
        return @" ";
    }
    return returnstr;
}


@end
