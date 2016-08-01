//
//  GDWKWebViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDWKWebViewController.h"
#import <WebKit/WebKit.h>
#import "GDHomeManager.h"
#import "GDHTMLDataModel.h"
#define WebViewNav_TintColor ([UIColor orangeColor])

@interface GDWKWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)UIProgressView *progressView;
@property (nonatomic, assign) NSUInteger loadCount;
@end

@implementation GDWKWebViewController

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
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 1)];
    
    progressView.tintColor = WebViewNav_TintColor;
    
    progressView.trackTintColor = [UIColor redColor];
    
    [self.view addSubview:progressView];
    
    self.progressView = progressView;
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 设置偏好设置
    config.preferences = [[WKPreferences alloc] init];
    // 默认为0
    config.preferences.minimumFontSize = -10;
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    // web内容处理池，由于没有属性可以设置，也没有方法可以调用，不用手动创建
    config.processPool = [[WKProcessPool alloc] init];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                      configuration:config];
    // 导航代理
    self.webView.navigationDelegate = self;
    // 与webview UI交互代理
    self.webView.UIDelegate = self;
    //通过监听estimatedProgress可以获取它的加载进度 还可以监听它的title ,URL, loading
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view insertSubview:self.webView belowSubview:self.progressView];
    
    [[GDHomeManager shareInstance]parsingHTMLRequestWithURL:_url success:^(GDHTMLDataModel *dataMoedel) {
        
//        [self.webView loadHTMLString:dataMoedel.html baseURL:[NSURL URLWithString:dataMoedel.shareimg]];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:dataMoedel.baseUrl]]];
        NSLog(@"%@",dataMoedel.baseUrl);
    } error:^(NSError *error) {
        
    }];
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"loading"]) {
        
    } else if ([keyPath isEqualToString:@"title"]) {
        self.title = self.webView.title;
    } else if ([keyPath isEqualToString:@"URL"]) {
        
    } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        self.progressView.progress = self.webView.estimatedProgress;
    }
    
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

- (void)setLoadCount:(NSUInteger)loadCount {
    _loadCount = loadCount;
    
    if (loadCount == 0) {
        self.progressView.hidden = YES;
        [self.progressView setProgress:0 animated:NO];
    }else {
        self.progressView.hidden = NO;
        CGFloat oldP = self.progressView.progress;
        CGFloat newP = (1.0 - oldP) / (loadCount + 1) + oldP;
        if (newP > 0.95) {
            newP = 0.95;
        }
        [self.progressView setProgress:newP animated:YES];
        
    }
}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.loadCount ++;
}
// 内容返回时
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    self.loadCount --;
}
//失败
- (void)webView:(WKWebView *)webView didFailNavigation: (null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    self.loadCount --;
    NSLog(@"%@",error);
}


-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
    NSString *js = @"document.getElementsByClassName('top-bar')[0].style.display = 'none';\
    document.getElementsByClassName('logo-bar')[0].style.display = 'none';\
    document.getElementsByClassName('page-menu')[0].style.display = 'none';\
    document.getElementsByClassName('mod-block-a-hd')[0].style.display = 'none';";
    
    NSString *jss =@"document.getElementsByClassName('news-content-ft-common')[0].remove();\
    document.getElementsByClassName('news-content-block-ft')[0].remove();\
    document.getElementsByClassName('recommend')[0].remove();\
    document.getElementsByClassName('page-footer')[0].remove();";
    
    [webView evaluateJavaScript:js completionHandler:nil];
    [webView evaluateJavaScript:jss completionHandler:nil];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];

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
