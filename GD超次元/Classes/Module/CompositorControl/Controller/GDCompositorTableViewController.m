//
//  GDCompositorTableViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCompositorTableViewController.h"
#import "GDCompositorSecondTableViewCell.h"
#import "GDCompositorTableViewCell.h"
#import "GDDetailsViewController.h"
#import "GDHomeManager.h"
#import "GDCompositorDataModel.h"


@interface GDCompositorTableViewController ()<GDCompositorDelegate,GDCompositorSecondDelegate>
@property(nonatomic,strong)NSMutableArray<GDCompositorDataArrayModel *> *data;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*firstPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*secondPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*thirdlyPosts;
@property(nonatomic,strong)NSMutableArray <GDCompositorPostsModel *>*fourthPosts;

@end

@implementation GDCompositorTableViewController
static NSString *IdentifierOne = @"CompositorIdentifierOne";
static NSString *IdentifierTwo = @"CompositorIdentifierTwo";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GDCompositorTableViewCell class] forCellReuseIdentifier:IdentifierOne];
    [self.tableView registerClass:[GDCompositorSecondTableViewCell class] forCellReuseIdentifier:IdentifierTwo];
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
        
//        NSLog(@"%@",_secondPosts);
    } error:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 635;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 1 || indexPath.row == 0) {
        GDCompositorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdentifierOne];
        cell.backgroundColor = GrayColor;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.delegate = self;
        cell.backgroundColor = [UIColor colorWithRed:236 / 255.0f green:239 / 255.0f blue:243 / 255.0f alpha:1];
        if (indexPath.row == 0) {
            for (GDCompositorPostsModel *posts in [self.firstPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
                [cell.groupTitle setText:@"后宫排行榜"];
            }
        }else if (indexPath.row == 1){
            for (GDCompositorPostsModel *posts in [self.secondPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
                [cell.groupTitle setText:@"奇幻排行榜"];
            }
        }
        return cell;
    }
        GDCompositorSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdentifierTwo];
        cell.backgroundColor = GrayColor;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.delegate = self;
        if (indexPath.row == 2) {
            for (GDCompositorPostsModel *posts in [self.thirdlyPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
                [cell.groupTitle setText:@"热血排行榜"];
            }
        }else if (indexPath.row == 3){
            for (GDCompositorPostsModel *posts in [self.fourthPosts reverseObjectEnumerator]) {
                [cell setModel:posts];
                [cell.groupTitle setText:@"冒险排行版"];
            }
        }
        return  cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D rotation;//3D旋转
    
    rotation = CATransform3DMakeTranslation(0 ,50 ,20);
    //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    
    rotation = CATransform3DScale(rotation, 0.9, .9, 1);
    
    rotation.m34 = 1.0/ -600;
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
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
