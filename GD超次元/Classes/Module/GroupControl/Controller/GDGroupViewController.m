//
//  GDGroupViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDGroupViewController.h"
#import "GDRequestMCDataModel.h"
#import "LORequestManger.h"
#import "GDHomeManager.h"
#import "GDDetailsDataModel.h"
#import <QuartzCore/QuartzCore.h>


@interface GDGroupViewController ()
@property(nonatomic,strong)UIView *VIEW;
@end

#define textURL @"http://api.18touch.com/index.php?c=acg&a=searchVedio&name=%E7%99%BD%E9%93%B6%E7%9A%84%E6%84%8F%E5%BF%97%20Argevollen&offset=1"

@implementation GDGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [SVProgressHUD showInfoWithStatus:@"load"];
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, 100, 44)];
//    button.backgroundColor = [UIColor darkGrayColor];
//    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [_VIEW removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"name"] = @"白银的意志 Argevollen";
    parame[@"&offset"] = @"1";
    [LORequestManger GET:SearchUrl parame:parame success:^(id response) {
        
        NSLog(@"%@",response);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    

//    [[GDNetWorkManager shareManager]requestWithGET:URL paramaeters:nil success:^(id responseObjcet) {
////        NSLog(@"%@",responseObjcet);
//        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
//            return @{
//                     @"posts":@"DataModel"
//                     };
//        }];
//            GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:responseObjcet];
//        NSLog(@"%@",dataModel.posts);
//    
//     
//    } error:nil];
    
//    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
//    parame[@"savePath"] = @"D:\\test2\\";
//    parame[@"fileName"] = @"test.jpg";
//    
//    [[GDNetWorkManager shareManager]requestWithGET:@"http://192.168.1.9:9001/FileUpload/downloadFileServlet?fileDescribe=" paramaeters:parame success:^(id responseObjcet) {
//        
//        NSLog(@"%@",responseObjcet);
//        
//    } error:^(NSError *erroerInfo) {
//        
//        NSLog(@"%@",erroerInfo);
//    }];
//    
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
