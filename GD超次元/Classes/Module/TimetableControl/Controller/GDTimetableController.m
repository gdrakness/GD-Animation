//
//  GDTimetableController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTimetableController.h"
#import "GDDetailsViewController.h"

#import "GDTableViewMondayCell.h"
#import "GDTableViewTuesdayCell.h"
#import "GDTableViewWednesdayCell.h"
#import "GDTableViewThursdayCell.h"
#import "GDTableViewFridayCell.h"
#import "GDTableViewSaturdayCell.h"
#import "GDTableViewSundayCell.h"

#import "GDHomeManager.h"
#import "GDTimeTableModel.h"

@class GDTimeTableDescModel;
@interface GDTimetableController ()<GDTableViewMondayCellDelegate,GDTableViewTuesdayCellDelegate,GDTableViewWednesdayCellDelegate,GDTableViewThursdayCellDelegate,GDTableViewFridayCellDelegate,GDTableViewSaturdayCellDelegate,GDTableViewSundayCellDelegate>

@end

@implementation GDTimetableController
static NSString *Identifier = @"timeTableController";
static NSString *MonIdentifier = @"MontimeTableController";
static NSString *TueIdentifier = @"TuetimeTableController";
static NSString *WedIdentifier = @"WedtimeTableController";
static NSString *ThuIdentifier = @"ThutimeTableController";
static NSString *FriIdentifier = @"FirtimeTableController";
static NSString *SatIdentifier = @"SattimeTableController";
static NSString *SunIdentifier = @"SuntimeTableController";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setTitle:@"时间表"];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    [self.tableView registerClass:[GDTableViewMondayCell class] forCellReuseIdentifier:MonIdentifier];
    [self.tableView registerClass:[GDTableViewTuesdayCell class] forCellReuseIdentifier:TueIdentifier];
    [self.tableView registerClass:[GDTableViewWednesdayCell class] forCellReuseIdentifier:WedIdentifier];
    [self.tableView registerClass:[GDTableViewThursdayCell class] forCellReuseIdentifier:ThuIdentifier];
    [self.tableView registerClass:[GDTableViewFridayCell class] forCellReuseIdentifier:FriIdentifier];
    [self.tableView registerClass:[GDTableViewSaturdayCell class] forCellReuseIdentifier:SatIdentifier];
    [self.tableView registerClass:[GDTableViewSundayCell class] forCellReuseIdentifier:SunIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GDTableViewMondayCell getCellOfHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        GDTableViewMondayCell *cell = [tableView dequeueReusableCellWithIdentifier:MonIdentifier];
        cell.delegate = self;
        return cell;
    }if (indexPath.row == 1){
        GDTableViewTuesdayCell *cell = [tableView dequeueReusableCellWithIdentifier:TueIdentifier];
        cell.delegate = self;
        return cell;
    }if (indexPath.row == 2) {
        GDTableViewWednesdayCell *cell = [tableView dequeueReusableCellWithIdentifier:WedIdentifier];
        cell.delegate = self;
        return cell;
    }if (indexPath.row == 3) {
        GDTableViewThursdayCell *cell = [tableView dequeueReusableCellWithIdentifier:ThuIdentifier];
        cell.delegate = self;
        return cell;
    }if (indexPath.row == 4) {
        GDTableViewFridayCell *cell = [tableView dequeueReusableCellWithIdentifier:FriIdentifier];
        cell.delegate = self;
        return cell;
    }if (indexPath.row == 5) {
        GDTableViewSaturdayCell *cell = [tableView dequeueReusableCellWithIdentifier:SatIdentifier];
        cell.delegate = self;
        return cell;
    }else {
        GDTableViewSundayCell *cell = [tableView dequeueReusableCellWithIdentifier:SunIdentifier];
        cell.delegate = self;
        return cell;
    }
    //    while ([cell.contentView.subviews lastObject] != nil) {
//        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//    }
//    cell.imageView.image = [UIImage imageNamed:@"mon2"];
    
}

#pragma mark -- delegate Method

-(void)getMondayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getTuesdayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)getWednesdayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)getThursdayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)getFridayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)getSaturdayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)getSundayTableViewPushDetailsViewControllerWithURL:(NSString *)url{
    
    [self pushViewControllerWithURL:url];

}

-(void)pushViewControllerWithURL:(NSString *)url{
    
    GDDetailsViewController *detailsVC = [[GDDetailsViewController alloc]init];
    detailsVC.url = url;
    [self.navigationController pushViewController:detailsVC animated:YES];
    
}


@end
