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
    
    [[GDNetWorkManager shareManager]requestWithGET:URL paramaeters:nil success:^(id responseObjcet) {
        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"GDRequestMCDataModel"
                     };
        }];
            GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:responseObjcet];
        for (GDRequestMCDataModel *posts in dataModel.posts) {
            [_image addObject:posts];
            NSLog(@"====%@",_image);
        }
        
    } error:nil];
//    NSLog(@"%@",_image);
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
