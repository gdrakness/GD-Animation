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
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*firstPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*secondPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*thirdlyPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*fourthPosts;

@end

@implementation GDCompositorTableViewController
static NSString *IdentifierOne = @"CompositorIdentifierOne";
static NSString *IdentifierTwo = @"CompositorIdentifierTwo";
static NSString *IdentifierThree = @"CompositorIdentifierThree";
static NSString *IdentifierFour = @"CompositorIdentifierFour";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:IdentifierOne];
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:IdentifierTwo];
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:IdentifierThree];
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:IdentifierFour];
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
            
            GDCompositorDataArrayModel *modelType = model;
            if ([modelType.type isEqualToString:@"后宫"]) {
                [self.firstPosts addObjectsFromArray:model.posts];
            }else if ([modelType.type isEqualToString:@"奇幻"]){
                [self.secondPosts addObjectsFromArray:model.posts];
            }else if ([modelType.type isEqualToString:@"热血"]){
                [self.thirdlyPosts addObjectsFromArray:model.posts];
            }else if ([modelType.type isEqualToString:@"冒险"]){
                [self.fourthPosts addObjectsFromArray:model.posts];
            }
        }
        
        [self.tableView reloadData];
        
        NSLog(@"%@",_secondPosts);
        
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
    
    return 635;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GDCompositorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdentifierOne];
    cell.delegate = self;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.backgroundColor = [UIColor colorWithRed:236 / 255.0f green:239 / 255.0f blue:243 / 255.0f alpha:1];
    
    switch (indexPath.section) {
        case 0:
            for (GDCompositorPostsModel *posts in [self.firstPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
            }
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:IdentifierTwo];
            for (GDCompositorPostsModel *posts in [self.secondPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
            }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:IdentifierThree];
            for (GDCompositorPostsModel *posts in [self.thirdlyPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
            }
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:IdentifierFour];
            for (GDCompositorPostsModel *posts in [self.fourthPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
            }
            break;
    }

//    while ([cell.contentView.subviews lastObject] != nil) {
//        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//    }
    return cell;
}

#pragma mark -- GDCompositorDelegate

-(void)getFirstViewButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getSecondViewFButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getSecondViewSButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getThirdlyViewOneButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getThirdlyViewTwoButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getThirdlyViewThreeButtonPushController:(NSString *)url{
    
    [self pushViewControllerWithURL:url];
}

-(void)getThirdlyViewFourButtonPushController:(NSString *)url{
    
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

-(NSMutableArray<GDCompositorPostsModel *> *)firstPosts{
    
    if (_firstPosts != nil) {
        return _firstPosts;
    }
    //实例化
    _firstPosts = [NSMutableArray array];
    
    return _firstPosts;
}

-(NSMutableArray<GDCompositorPostsModel *> *)secondPosts{
    if (_secondPosts != nil) {
        return _secondPosts;
    }
    //实例化
    _secondPosts = [NSMutableArray array];
    
    return _secondPosts;
}

-(NSMutableArray<GDCompositorPostsModel *> *)thirdlyPosts{
    if (_thirdlyPosts != nil) {
        return _thirdlyPosts;
    }
    //实例化
    _thirdlyPosts = [NSMutableArray array];
    
    return _thirdlyPosts;
}

-(NSMutableArray<GDCompositorPostsModel *> *)fourthPosts{
    if (_fourthPosts != nil) {
        return _fourthPosts;
    }
    //实例化
    _fourthPosts = [NSMutableArray array];
    
    return _fourthPosts;
}
@end
