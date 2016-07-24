//
//  GDTimetableController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTimetableController.h"

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
@interface GDTimetableController ()

@end

@implementation GDTimetableController
static NSString *Identifier = @"timeTableController";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    switch (indexPath.row) {
        case 0:
            cell = [[GDTableViewMondayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 1:
            cell = [[GDTableViewTuesdayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 2:
            cell = [[GDTableViewWednesdayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 3:
            cell = [[GDTableViewThursdayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 4:
            cell = [[GDTableViewFridayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 5:
            cell = [[GDTableViewSaturdayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
        case 6:
            cell = [[GDTableViewSundayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            break;
    }
//    cell.imageView.image = [UIImage imageNamed:@"mon2"];
    [cell sizeToFit];
    return cell;
    
}




@end
