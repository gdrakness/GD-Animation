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
@end

#define BDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
#define textURL @"http://api.moeju.cn/startup/slider"
#define BDWeather_URL @"http://api.map.baidu.com/telematics/v3/weather"


@implementation GDGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    NSDictionary *parameters = @{@"location":@"珠海",@"output":@"json",@"ak":BDWeather_KEY};

    [LORequestManger GET:PageFlowURL parame:nil success:^(id response) {
        
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




@end
