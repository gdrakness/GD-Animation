//
//  GDVideoWebViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/7.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDVideoWebViewController.h"
#import <WebKit/WebKit.h>

@interface GDVideoWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *webView;

@end

@implementation GDVideoWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWKWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWKWebView{
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    config.preferences = [[WKPreferences alloc]init];
    config.preferences.minimumFontSize = - 8;
    config.preferences.javaScriptEnabled = YES;
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    config.processPool = [[WKProcessPool alloc]init];
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    [self.view addSubview:_webView];
    NSLog(@"%@",_url);
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
