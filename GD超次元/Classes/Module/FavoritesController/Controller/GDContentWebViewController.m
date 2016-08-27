//
//  GDContentWebViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDContentWebViewController.h"
#import "LORequestManger.h"
#import <WebKit/WebKit.h>
#import "GDContentDataModel.h"

@interface GDContentWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *webView;
@end

@implementation GDContentWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWKWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getContentRequest{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"id"] = self.getID;
    parame[@"os"] = @"iOS";
    parame[@"v"] = @"2.1.0";
    [LORequestManger GET:requestURL parame:parame success:^(id response) {
        
        GDContentDataModel *dataModel = [GDContentDataModel mj_objectWithKeyValues:response];
        
        [self.webView loadHTMLString:dataModel.data.content baseURL:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
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
    [self getContentRequest];

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
