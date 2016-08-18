//
//  GDFavritesViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/18.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDFavritesViewController.h"
#import "GDFavoritesDataMoel.h"
#import "LORequestManger.h"
#import "GDHomeManager.h"

@interface GDFavritesViewController ()

@end

@implementation GDFavritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self getDataIsMore:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore:(BOOL)isMore{
    
   [[GDHomeManager shareInstance]getFindFaovritesRequestWithURl:nil success:^(GDFavoritesDataMoel *dataModel) {
       NSLog(@"%@",dataModel);
   } error:^(NSError *error) {
       
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
