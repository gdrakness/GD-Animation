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

@interface GDGroupViewController ()
@end

@implementation GDGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [LORequestManger GET:CompositorURL success:^(id response) {
        
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
