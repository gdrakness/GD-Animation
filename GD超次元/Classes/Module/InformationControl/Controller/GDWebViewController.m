
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
@end

@implementation GDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self loadWebView];
//    [self setRefreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRefreshData{
    

    
}

-(void)loadWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    self.webView.delegate = self;
    [self.view addSubview:_webView];
    _webView.scalesPageToFit = YES;
    _webView.contentMode = UIViewContentModeScaleToFill;
    
    [[GDHomeManager shareInstance]parsingHTMLRequestWithURL:_url success:^(GDHTMLDataModel *dataMoedel) {
        
        self.htmlString = dataMoedel;
//        NSLog(@"%@",self.htmlString.html);
        [self.webView loadHTMLString:dataMoedel.html baseURL:[NSURL URLWithString:_url]];
        NSLog(@"%@",dataMoedel);
    } error:^(NSError *error) {
        
    }];
}


//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    
//    return  YES;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
