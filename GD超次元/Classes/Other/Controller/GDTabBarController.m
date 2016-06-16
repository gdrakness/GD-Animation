//
//  GDTabBarController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/17.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDMainViewController.h"
#import "GDBarButtonItem.h"

@interface GDTabBarController ()

@end

@implementation GDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation];
    
    [self addChildViewController:[GDMainViewController pageControlStyleFlood]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setNavigation{
    
    GDBarButtonItem *settingItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"set_hover@2x" image:@"set@2x" target:self action:@selector(settingAction:)];
    
    GDBarButtonItem *searchItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"glass_hover@2x" image:@"glass@2x" target:self action:@selector(searchAction:)];
    
    self.navigationItem.leftBarButtonItems = @[settingItem,searchItem];
    
}

-(void)searchAction:(id)sender{
    NSLog(@"%s",__func__);
}

-(void)settingAction:(id)sender{
    NSLog(@"%s",__func__);
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
