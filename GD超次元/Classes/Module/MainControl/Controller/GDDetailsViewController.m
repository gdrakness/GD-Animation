//
//  GDDetailsViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/22.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDetailsViewController.h"
#import "GDDetailsDataModel.h"
#import "GDVideoDetailsTableViewCell.h"
#import "GDDetailsDataModel.h"

@interface GDDetailsViewController ()
@property(nonatomic,strong)NSMutableArray<GDVideosDetailsModel *> *videos;
@property(nonatomic,strong)UIView *detailsView;
@property(nonatomic,strong)UIButton *labBtn;
@end

@implementation GDDetailsViewController

static NSString *fIdentifier = @"fDetailsView";
static NSString *sIdentifier = @"sDetailsView";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor grayColor];
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self getDataIsMore:NO];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
//        UITableViewCell *cell = [self tableView: tableView cellForRowAtIndexPath:indexPath];
//        
//        return cell.height;
        return 100;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return  10;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (indexPath.row == 0) {
//        return 200;
//    }
//    return 150;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:fIdentifier];
    
    
    if (indexPath.section == 0) {
        GDVideosDetailsModel *model = self.videos[indexPath.row];
        
       GDVideoDetailsTableViewCell* cell1 = [[GDVideoDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fIdentifier];
        
        cell1.model = model;
        cell = cell1;
    
    }
    
    else if (indexPath.section == 1){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sIdentifier];
        cell.backgroundColor = [UIColor greenColor];
        }
    return cell;
}


-(void)getDataIsMore:(BOOL)isMore{
    
    [[GDHomeManager shareInstance]getDetailsWithURL:self.url success:^(GDDetailsDataModel *detailsData) {
        
        if (!isMore) {
            //如果不是更多,则清空原来数据
            [self.videos removeAllObjects];
        }
        
        [self.videos addObjectsFromArray:detailsData.videos];
        [self.tableView reloadData];
        
        NSLog(@"=======%@",self.videos);
    } error:^(NSError *error) {
        
    }];
}

-(NSMutableArray<GDVideosDetailsModel *> *)videos{
    if (_videos != nil) {
        return _videos;
    }
    //实例化
    _videos = [NSMutableArray array];
    
    return _videos;
}

@end
