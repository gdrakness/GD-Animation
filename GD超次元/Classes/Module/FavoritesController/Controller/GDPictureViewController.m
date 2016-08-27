//
//  GDPictureViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDPictureViewController.h"
#import "LORequestManger.h"

@interface GDPictureViewController ()

@end

@implementation GDPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getFindDataIsMore];
}

-(void)getFindDataIsMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];

    parame[@"os"] = @"iOS";
    parame[@"v"] = @"2.1.0";
    
    
}

//-(void)addCollectionView{
//    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
