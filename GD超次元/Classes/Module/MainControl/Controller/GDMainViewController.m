//
//  GDMainViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDMainViewController.h"

#import "GDCompositorTableViewController.h"
#import "GDClassViewController.h"
#import "GDInformationController.h"
#import "GDGroupViewController.h"
#import "GDDetailsViewController.h"

#import "GDRequestMCDataModel.h"
#import "GDMainViewTableViewCell.h"

#import "GDMainViewTableViewCell.h"
#import "GDBarButtonItem.h"

@class DataModel;
@interface SDWebImageManager  (cache)


- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager (cache)

- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url {
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ?  YES : NO;
}

@end

@interface GDMainViewController ()

@property (nonatomic, strong) NSMutableArray<DataModel *> *posts;

@end

@implementation GDMainViewController
//@synthesize tableView = tableView;
static NSString *Identifier = @"Identifier";


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = blueColor;
    
    [self.tableView registerClass:[GDMainViewTableViewCell class] forCellReuseIdentifier:Identifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(7, 0, 0, 0);
    
    [self setRefresh];
//    [self.tableView.mj_header beginRefreshing];
    [self getDataIsMore:NO];
    
       
}

- (void)viewDidAppear:(BOOL)animated {
//    [self.tableView triggerPullToRefresh];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRefresh{
    
    __unsafe_unretained UITableView *tableView = self.tableView;
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(getDataIsMore:)];
    
    [header setTitle:@"下拉刷新..." forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正奋力加载中..." forState:MJRefreshStateRefreshing];

    self.tableView.mj_header = header;
    
    // 下拉刷新
//    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"下拉刷新");
//            // 结束刷新
//            [tableView.mj_header endRefreshing];
//        });
//    }];
//    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    tableView.mj_header.automaticallyChangeAlpha = YES;
//    
//    // 上拉刷新
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            
            [tableView.mj_footer endRefreshing];
        });
    }];

}


+(WMPageController *)pageControlStyleFlood{
    NSArray *viewControl = @[[GDCompositorTableViewController class],[GDClassViewController class],[GDMainViewController class],[GDInformationController class],[GDGroupViewController class]];
    NSArray *title = @[@"动画排行",@"分类推荐",@"次元新番",@"次元资讯",@"同人图集"];
    
    WMPageController *pageControl = [[WMPageController alloc]initWithViewControllerClasses:viewControl andTheirTitles:title];
    pageControl.showOnNavigationBar = NO;
    pageControl.titleSizeNormal = 13;
    pageControl.titleSizeSelected = 13;
    pageControl.pageAnimatable = NO;
    pageControl.menuViewStyle = WMMenuViewStyleFlood;
    pageControl.titleColorSelected = [UIColor whiteColor];
    pageControl.titleColorNormal = blueColor;
    pageControl.progressColor = blueColor;
    pageControl.itemsWidths = @[@(65),@(65),@(65),@(65),@(65)];
    pageControl.selectIndex = 4;
    
    return pageControl;
}

//去掉字符串的 "\\"
+(NSString *)enCodeString:(NSString *)encode{
    NSMutableString *string=[NSMutableString stringWithString:encode];
    // NSMutableString *string=[NSMutableString stringWithString:encodedString];
    [string replaceOccurrencesOfString:@"\\" withString:@"" options:1 range:NSMakeRange(0, string.length)];
    NSLog(@"%@",string);
    return  string;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

//    NSLog(@"%ld",[self.posts count] );
    return self.posts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
    
}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    return 0;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
//    DataModel *model = self.posts[indexPath.row];
//    
//    cell.model = model;
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(GDMainViewTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DataModel *model = self.posts[indexPath.row];
    
    if (![[SDWebImageManager sharedManager] memoryCachedImageExistsForURL:[NSURL URLWithString:model.img]]) {
        
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
//    [cell cellOffset];
    cell.model = model;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GDDetailsViewController *viewControl = [[GDDetailsViewController alloc]init];
    
     DataModel *model = self.posts[indexPath.row];
     viewControl.url = model.url;
//        NSLog(@"%@",viewControl.url);
    
    [self.navigationController pushViewController:viewControl animated:YES];
}

-(void)getDataIsMore:(BOOL)isMore{
    
        [[GDHomeManager shareInstance]getFindDealsWithParams:nil success:^(GDRequestMCDataModel *dataModel) {
            
            if (!isMore) {
                //如果不是更多,则清空原来数据
                [self.posts removeAllObjects];
            }
            
//            dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@",dataModel);
            
                [self.posts addObjectsFromArray:dataModel.posts];
//            NSLog(@"%@",self.posts);
                [self.tableView reloadData];
//            });

//            //结束刷新
            [self.tableView.mj_header endRefreshing];
//            [self.tableView.pullToRefreshView stopAnimating];
//            [self.tableView.infiniteScrollingView stopAnimating];
            
        } error:^(NSError *error) {
            
            NSLog(@"%@",error);
        }];

}

-(NSMutableArray<DataModel *> *)posts{
    
    if (_posts != nil) {
        return _posts;
    }
    //实例化
    _posts = [NSMutableArray array];
    
    return _posts;
}
@end
