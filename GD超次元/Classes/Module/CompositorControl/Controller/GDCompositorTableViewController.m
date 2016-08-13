//
//  GDCompositorTableViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCompositorTableViewController.h"
#import "GDCompositorTableViewCell.h"
#import "GDDetailsViewController.h"
#import "GDHomeManager.h"
#import "GDCompositorDataModel.h"


@interface GDCompositorTableViewController ()<GDCompositorDelegate>
@property(nonatomic,strong)NSMutableArray<GDCompositorDataArrayModel *> *data;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*posts;
@end

@implementation GDCompositorTableViewController
static NSString *Identifier = @"CompositorIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:Identifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getDataIsMore];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore{
    
    [[GDHomeManager shareInstance]getCompositorRequestWithURL:nil success:^(GDCompositorDataModel *compositorDataModel) {
        
        [self.data addObjectsFromArray:compositorDataModel.data];
        
        for (GDCompositorDataArrayModel *model in [self.data reverseObjectEnumerator]) {
            
            GDCompositorDataArrayModel *cellItem = model;
            if ([cellItem.type isEqualToString:@"后宫"]) {
            [self.posts addObjectsFromArray:model.posts];
            }
        }
        
        [self.tableView reloadData];
        
        NSLog(@"%@",_posts);
        
    } error:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 610;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GDCompositorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.backgroundColor = [UIColor colorWithRed:236 / 255.0f green:239 / 255.0f blue:243 / 255.0f alpha:1];
    
    if (indexPath.section == 0) {
        
        for (GDCompositorPostsModel *posts in [self.posts reverseObjectEnumerator]) {
            
            [cell setModel:posts];
        }
    }
    return cell;
}

-(void)getFirstViewButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getSecondViewFButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getSecondViewSButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)pushViewControllerWithURL:(NSString *)url{
    GDDetailsViewController *DetailsVC = [[GDDetailsViewController alloc]init];
    DetailsVC.url = url;
    [self.navigationController pushViewController:DetailsVC animated:YES];
}


-(NSMutableArray<GDCompositorDataArrayModel *> *)data{
    
    if (_data != nil) {
        return _data;
    }
    //实例化
    _data = [NSMutableArray array];
    
    return _data;
}

-(NSMutableArray<GDCompositorPostsModel *> *)posts{
    
    if (_posts != nil) {
        return _posts;
    }
    //实例化
    _posts = [NSMutableArray array];
    
    return _posts;
}

@end
