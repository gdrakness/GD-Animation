//
//  GDDetailsViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/22.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDetailsViewController.h"
#import "GDDetailsDataModel.h"

@interface GDDetailsViewController ()
@property(nonatomic,strong)NSMutableArray<GDVideosDetailsModel *> *videos;
@property(nonatomic,strong)UIView *detailsView;
@property(nonatomic,strong)UIButton *labBtn;
@property (nonatomic, assign) CGFloat heightg;
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
        CGFloat detailsH = [UIScreen mainScreen].bounds.size.height / 8;
         _heightg = detailsH == detailsH + _labBtn.height ? detailsH : detailsH + _labBtn.height;
        return _heightg;
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
//    if (indexPath.section == 0) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fIdentifier];
//        CGFloat detailsH = [UIScreen mainScreen].bounds.size.height / 8;
//        CGFloat heigth = detailsH == detailsH + _labBtn.height ? detailsH : detailsH + _labBtn.height;
//        
//        _detailsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _heightg)];
//        [cell.contentView addSubview:_detailsView];
//        
//        _labBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 50)];
//        [_labBtn setTitle:@"gggggggggdddggggggggggggfffggggggfffggggggggfffgggggggggggggg" forState:UIControlStateNormal];
//        _labBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//        _labBtn.titleLabel.textColor = [UIColor blackColor];
//        _labBtn.backgroundColor = [UIColor orangeColor];
//        [_labBtn addTarget:self action:@selector(touchesAction) forControlEvents:UIControlEventTouchUpInside];
//        [_detailsView addSubview:_labBtn];
//        
//        }
//    
//    else if (indexPath.section == 1){
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sIdentifier];
//        cell.backgroundColor = [UIColor greenColor];
//        }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:fIdentifier];
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fIdentifier];
        
        _detailsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        [cell.contentView addSubview:_detailsView];
        
//        _labBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 50)];
//        [_labBtn setTitle:@"gggggggggdddggggggggggggfffggggggfffg gggggggfffgggggggggggggg" forState:UIControlStateNormal];
//        _labBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//        _labBtn.titleLabel.textColor = [UIColor blackColor];
//        _labBtn.backgroundColor = [UIColor orangeColor];
//        [_labBtn addTarget:self action:@selector(touchesAction) forControlEvents:UIControlEventTouchUpInside];
//        [_detailsView addSubview:_labBtn];
        
    }
    
    else if (indexPath.section == 1){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sIdentifier];
        cell.backgroundColor = [UIColor greenColor];
    }
    
    
}


-(void)touchesAction{
    
    _labBtn.height += 100;
//    [self.tableView reloadData];
}

-(void)getDataIsMore:(BOOL)isMore{
    
    [[GDHomeManager shareInstance]getDetailsWithURL:self.url sccess:^(GDDetailsDataModel *detailsData) {
        
        if (!isMore) {
            //如果不是更多,则清空原来数据
            [self.videos removeAllObjects];
        }

        [self.videos addObjectsFromArray:detailsData.videos];
        [self.tableView reloadData];
        
        NSLog(@"%@",detailsData);
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
