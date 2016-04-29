//
//  GDMainViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDMainViewController.h"
#import "GDCompositorTableViewController.h"
#import "GDClassTableViewController.h"
#import "GDInformationTableViewController.h"
#import "GDGroupViewController.h"
#import "GDBarButtonItem.h"


@interface GDMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    self.view.backgroundColor = blueColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+(WMPageController *)pageControlStyleFlood{
    NSArray *viewControl = @[[GDCompositorTableViewController class],[GDClassTableViewController class],[GDMainViewController class],[GDInformationTableViewController class],[GDGroupViewController class]];
    NSArray *title = @[@"动画排行",@"分类推荐",@"新番速递",@"动漫资讯",@"兴趣小组"];
    
    WMPageController *pageControl = [[WMPageController alloc]initWithViewControllerClasses:viewControl andTheirTitles:title];
    pageControl.showOnNavigationBar = NO;
    pageControl.titleSizeNormal = 13;
    pageControl.titleSizeSelected = 13;
    pageControl.pageAnimatable = YES;
    pageControl.menuViewStyle = WMMenuViewStyleFoold;
    pageControl.titleColorSelected = [UIColor whiteColor];
    pageControl.titleColorNormal = blueColor;
    pageControl.progressColor = blueColor;
    pageControl.itemsWidths = @[@(65),@(65),@(65),@(65),@(65)];
    pageControl.selectIndex = 2;
    
    return pageControl;
}

-(void)setNavigation{
    
    GDBarButtonItem *settingItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"set_hover@2x" image:@"set@2x" target:self action:@selector(settingAction:)];
    
    GDBarButtonItem *searchItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"glass_hover@2x" image:@"glass@2x" target:self action:@selector(searchAction:)];
    
    self.navigationItem.leftBarButtonItems = @[settingItem,searchItem];
    
}

+(NSString *)enCodeString:(NSString *)encode{
    NSMutableString *string=[NSMutableString stringWithString:encode];
    // NSMutableString *string=[NSMutableString stringWithString:encodedString];
    [string replaceOccurrencesOfString:@"\\" withString:@"" options:1 range:NSMakeRange(0, string.length)];
    NSLog(@"%@",string);
    return  string;
}

-(void)searchAction:(id)sender{
    NSLog(@"%s",__func__);
}

-(void)settingAction:(id)sender{
    NSLog(@"%s",__func__);
}
@end
