
//
//  GDWebViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDWebViewController.h"
#import <WebKit/WebKit.h>
#import "GDHomeManager.h"
#import "GDHTMLDataModel.h"

@interface GDWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)GDHTMLDataModel *htmlString;
@property(nonatomic,strong)UIAlertView *myAlert;
@end

@implementation GDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    [self loadWebView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
//    if (_myAlert==nil){
//        _myAlert = [[UIAlertView alloc] initWithTitle:nil
//                                             message: @"正在讀取網路資料"
//                                            delegate: self
//                                   cancelButtonTitle: nil
//                                   otherButtonTitles: nil];
//        
//        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//        activityView.frame = CGRectMake(120.f, 48.0f, 37.0f, 37.0f);
//        [_myAlert addSubview:activityView];
//        [activityView startAnimating];
//        [_myAlert show];
//    }
//    [SVProgressHUD show];
   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [_myAlert dismissWithClickedButtonIndex:0 animated:YES];
//    [SVProgressHUD dismiss];
    
}

-(void)loadWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    self.webView.delegate = self;
    [self.view addSubview:_webView];
//    _webView.scalesPageToFit = YES;
//    _webView.contentMode = UIViewContentModeScaleAspectFill;
    
    [[GDHomeManager shareInstance]parsingHTMLRequestWithURL:_url success:^(GDHTMLDataModel *dataMoedel) {
        
        self.htmlString = dataMoedel;
//        NSLog(@"%@",self.htmlString.html);
//        [self.webView loadHTMLString:dataMoedel.html baseURL:[NSURL URLWithString:dataMoedel.baseUrl]];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:dataMoedel.baseUrl]]];
        NSLog(@"%@",dataMoedel.baseUrl);
    } error:^(NSError *error) {
        
    }];
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *js = @"document.getElementsByClassName('top-bar')[0].style.display = 'none';\
                    document.getElementsByClassName('logo-bar')[0].style.display = 'none';\
                    document.getElementsByClassName('page-menu')[0].style.display = 'none';\
                    document.getElementsByClassName('mod-block-a-hd')[0].style.display = 'none';";
    
    NSString *jss =@"document.getElementsByClassName('news-content-ft-common')[0].remove();\
    document.getElementsByClassName('news-content-block-ft')[0].remove();\
    document.getElementsByClassName('recommend')[0].remove();\
    document.getElementsByClassName('page-footer')[0].remove();";
    
    [webView stringByEvaluatingJavaScriptFromString:js];
    [webView stringByEvaluatingJavaScriptFromString:jss];
    
    return  YES;
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
