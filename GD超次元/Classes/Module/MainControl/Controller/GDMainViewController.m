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

@interface GDMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    pageControl.titleSizeSelected = 15;
    pageControl.pageAnimatable = YES;
    pageControl.menuViewStyle = WMMenuViewStyleFoold;
    pageControl.titleColorSelected = [UIColor whiteColor];
    pageControl.titleColorNormal = blueColor;
    pageControl.progressColor = blueColor;
    pageControl.itemsWidths = @[@(80),@(80),@(80),@(80),@(80)];
    pageControl.selectIndex = 2;
    
    return pageControl;
}



+(NSString *)enCodeString:(NSString *)encode{
    NSMutableString *string=[NSMutableString stringWithString:encode];
    // NSMutableString *string=[NSMutableString stringWithString:encodedString];
    [string replaceOccurrencesOfString:@"\\" withString:@"" options:1 range:NSMakeRange(0, string.length)];
    NSLog(@"%@",string);
    return  string;
}


@end
