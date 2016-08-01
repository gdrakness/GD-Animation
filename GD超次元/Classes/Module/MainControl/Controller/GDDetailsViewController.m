//
//  GDDetailsViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/22.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDetailsViewController.h"
#import "GDVideoDetailsTableViewCell.h"
#import "GDVideoBluesTableViewCell.h"
#import "GDDetailsDataModel.h"


@interface GDDetailsViewController ()
@property(nonatomic,strong)NSMutableArray<GDVideosDetailsModel *> *videos;
@property(nonatomic,strong)GDDetailsDataModel *detailsModel;
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
    [self.tableView registerClass:[GDVideoDetailsTableViewCell class] forCellReuseIdentifier:fIdentifier];
    [self.tableView registerClass:[GDVideoBluesTableViewCell class] forCellReuseIdentifier:sIdentifier];
    self.tableView.backgroundColor = [UIColor colorWithRed:236 / 255.0f green:239 / 255.0f blue:243 / 255.0f alpha:1];
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self getDataIsMore:NO];
    
    self.tableView.scrollEnabled = NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 170;
        
    }else if (indexPath.section == 1){
        
        return 250;
    }
    return 55;
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
    
    if (indexPath.section == 0) {
        GDVideoDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fIdentifier];
        GDDetailsDataModel *cellItem = self.detailsModel;
        [cell setModel:cellItem];
        return cell;
    }else{
        GDVideoBluesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sIdentifier];
        
        return cell;
    }
}


-(void)getDataIsMore:(BOOL)isMore{
    
    [[GDHomeManager shareInstance]getDetailsWithURL:_url success:^(GDDetailsDataModel *detailsData) {
        
        if (!isMore) {
            //如果不是更多,则清空原来数据
            [self.videos removeAllObjects];
        }
        self.detailsModel = detailsData;
        [self.videos addObjectsFromArray:detailsData.videos];
        [self.tableView reloadData];
        
        NSLog(@"=======%@",detailsData);
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
