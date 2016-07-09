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
    self.tabBar.hidden = YES;
    
    [self addChildViewController:[GDMainViewController pageControlStyleFlood]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setNavigation{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 45)];
    imageView.image = [UIImage imageNamed:@"new_logo"];
    
    self.navigationItem.titleView = imageView;
    
    GDBarButtonItem *settingItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"set_hover@2x" image:@"set@2x" target:self action:@selector(settingAction:)];
    
    GDBarButtonItem *searchItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"glass_hover@2x" image:@"glass@2x" target:self action:@selector(searchAction:)];
    
    self.navigationItem.leftBarButtonItems = @[settingItem,searchItem,];
    
    GDBarButtonItem *scheduleItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"clock_hover@2x" image:@"clock@2x" target:self action:@selector(scheduleAction:)];
    
    GDBarButtonItem *collectionItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"sc_hover@2x" image:@"sc@2x" target:self action:@selector(collectionAction:)];
    
    self.navigationItem.rightBarButtonItems = @[collectionItem,scheduleItem];
    
}

-(void)searchAction:(id)sender{
    NSLog(@"%s",__func__);
}

-(void)settingAction:(id)sender{
    NSLog(@"%s",__func__);
}

-(void)scheduleAction:(id)sender{
    NSLog(@"%s",__func__);
}

-(void)collectionAction:(id)sender{
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
