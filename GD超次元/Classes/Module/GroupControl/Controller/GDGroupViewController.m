//
//  GDGroupViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDGroupViewController.h"
#import "GDRequestMCDataModel.h"

@interface GDGroupViewController ()
@property (nonatomic, copy) NSMutableArray *image;
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
   _image = [NSMutableArray new];
    
//    [[GDNetWorkManager shareManager]requestWithGET:URL paramaeters:nil success:^(id responseObjcet) {
        //NSLog(@"%@",responseObjcet);
//        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
//            return @{
//                     @"posts":@"GDRequestMCDataModel"
//                     };
//        }];
//            GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:responseObjcet];
//        NSLog(@"%@",dataModel.posts.firstObject.img);
    
        
        
//        for (GDRequestMCDataModel *posts in dataModel.posts) {
//            [_image addObject:posts];
//            NSLog(@"====%@",_image);
//        }
        
//    } error:nil];
//    NSLog(@"%@",_image);
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"savePath"] = @"D:\\test2\\";
    parame[@"fileName"] = @"test.jpg";
    
    [[GDNetWorkManager shareManager]requestWithGET:@"http://192.168.1.9:9001/FileUpload/downloadFileServlet?fileDescribe=" paramaeters:parame success:^(id responseObjcet) {
        
        NSLog(@"%@",responseObjcet);
        
    } error:^(NSError *erroerInfo) {
        
        NSLog(@"%@",erroerInfo);
    }];
    
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
