//
//  GDInformationController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformationController.h"
#import "GDWebViewController.h"

#import "GDInformationCollectionCell.h"
#import "GDInformatTableBigPictureCell.h"
#import "GDInformatTablePictureCell.h"
#import "GDInformatTableViewCell.h"

#import "GDHomeManager.h"
#import "GDInformationRequstDataModel.h"

@interface GDInformationController ()
@property(nonatomic,strong)UISegmentedControl *segmented;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UIView *showView;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray<GDInformationDataModel *> *posts;
@end

@implementation GDInformationController
static NSString *Identifier1 = @"GDInformationTableViewCell1";
static NSString *Identifier2 = @"GDInformationTableViewCell2";
static NSString *Identifier3 = @"GDInformationTableViewCell3";

static NSString *identifier = @"GDInformationCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _array = [[NSMutableArray alloc]initWithObjects:@"最新资讯",@"精彩专题", nil];
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithItems:_array];
    segmented.selectedSegmentIndex = 0;
    segmented.tintColor = blueColor;
    segmented.frame = CGRectMake(self.view.bounds.size.width / 2 - 100, 10, 200, 30);
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName,blueColor,NSForegroundColorAttributeName,nil];
    [segmented setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    self.segmented = segmented;
    [segmented addTarget:self action:@selector(selectSegmentedIndex:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmented];
    
    [self addTableView];
    
//    _showView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, self.view.width, self.view.height)];
//    [self.view addSubview:_showView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectSegmentedIndex:(UISegmentedControl *)seg{
    
    NSInteger Index = seg.selectedSegmentIndex;
    
    switch (Index) {
        case 0:
            [self addTableView];
            
            break;
            
        case 1:
            [self addCollectionView];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
                [self getCollectionDataIsMore:NO];
                
//            });
            break;
    }
}

-(void)setCollectionRefresh{
    
    __unsafe_unretained UICollectionView *collectionView = self.collectionView;
    
    MJRefreshGifHeader *header =[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(getCollectionDataIsMore:)];
    
    [header setTitle:@"下拉刷新..." forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正奋力加载中..." forState:MJRefreshStateRefreshing];
    
    self.collectionView.mj_header = header;
    
    collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self getCollectionDataIsMore:YES];
    }];
}

-(void)setTableRefresh{
    
    __unsafe_unretained UITableView *tableView = self.tableView;
    
    MJRefreshGifHeader *header =[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(getTableDataIsMore:)];
    
    [header setTitle:@"下拉刷新..." forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正奋力加载中..." forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = header;
    
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self getTableDataIsMore:YES];
    }];
}

-(void)getCollectionDataIsMore:(BOOL)isMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];

    GDInformationDataModel *lastOj = self.posts.lastObject;
    parame[@"lastid"] = lastOj.id;
    parame[@"lasttime"] = lastOj.posttime;
    
    NSLog(@"%@",parame);
    
    [[GDHomeManager shareInstance]getFindInformationRequestWithURL:InformationURL params:parame success:^(GDInformationRequstDataModel *dataModel) {
        
        if (!isMore) {
            
            [self.posts removeAllObjects];
        }
        
        [self.posts addObjectsFromArray:dataModel.posts];
        [self.collectionView reloadData];
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView.mj_header endRefreshing];
        //        NSLog(@"%@",self.posts);
        
    } error:^(NSError *error) {
        
    }];
}

-(void)getTableDataIsMore:(BOOL)isMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    
    GDInformationDataModel *lastOj = self.posts.lastObject;
    parame[@"lastid"] = lastOj.id;
    parame[@"lasttime"] = lastOj.posttime;
    
    NSLog(@"%@ --- %@",lastOj.id,lastOj.posttime);

    [[GDHomeManager shareInstance]getFindInformationRequestWithURL:INformationURL params:parame success:^(GDInformationRequstDataModel *dataModel) {
        
        if (!isMore) {
            
            [self.posts removeAllObjects];
        }
        
        [self.posts addObjectsFromArray:dataModel.posts];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
//                NSLog(@"%@",self.posts);
        
    } error:^(NSError *error) {
        
    }];
}



-(void)addTableView{
    
    [_collectionView removeFromSuperview];
    [self.posts removeAllObjects];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.width, self.view.height - 45)];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
    [_tableView registerClass:[GDInformatTableBigPictureCell class] forCellReuseIdentifier:Identifier1];
    [_tableView registerClass:[GDInformatTablePictureCell class] forCellReuseIdentifier:Identifier2];
    [_tableView registerClass:[GDInformatTableViewCell class] forCellReuseIdentifier:Identifier3];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    [self getTableDataIsMore:NO];

    [self setTableRefresh];
}

-(void)addCollectionView{
    
    [_tableView removeFromSuperview];
    [self.posts removeAllObjects];

    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((WIDTH - 30) / 2, (HEIGHT - 200) / 2);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 45, self.view.width, self.view.height - 40) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorWithRed:208 / 255.0f green:208 / 255.0f blue:208 / 255.0f alpha:0.5];
;
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    
    [_collectionView registerClass:[GDInformationCollectionCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_collectionView];
    
    [self setCollectionRefresh];

    
}


/***********************TableView************************/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.posts.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 8 == 0) {
       return [GDInformatTableBigPictureCell getCellHeight];
    }else if (indexPath.row % 4 == 0){
        return  100;
    }else {
        return 87;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    GDInformationDataModel *cellItme = self.posts[indexPath.row];
    
    if ((indexPath.row % 8 == 0)) {
        GDInformatTableBigPictureCell  *cell = [tableView dequeueReusableCellWithIdentifier:Identifier1];
        [cell setModel:cellItme];
        return cell;
    }else if ((indexPath.row % 4 == 0)){
        GDInformatTablePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier2];
        [cell setModel:cellItme];
        return cell;
    }else{
        GDInformatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier3];
        [cell setModel:cellItme];
        return cell;
    }
    
//    return cell;
}

/***********************CollectionView************************/

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.posts.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDInformationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    GDInformationDataModel *cellItem = self.posts[indexPath.item];
    [cell setModel:cellItem];
    
    cell.layer.cornerRadius = 5;
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDWebViewController *webView = [[GDWebViewController alloc]init];
    GDInformationDataModel *cellItem = self.posts[indexPath.item];
    webView.url = cellItem.url;
    
    [self.navigationController pushViewController:webView animated:YES];

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation((90.0*M_PI/180), 0.0, 0.7, 0.4);
    rotation.m44 = 1.0/-600;
    //阴影
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    //阴影偏移
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    //透明度
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    //锚点
    cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [UIView beginAnimations:@"rotaion" context:NULL];
    
    [UIView setAnimationDuration:0.8];
    
    cell.layer.transform = CATransform3DIdentity;
    
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    [UIView commitAnimations];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
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


-(NSMutableArray<GDInformationDataModel *> *)posts{
    
    if (_posts != nil) {
        return _posts;
    }
    //实例化
    _posts = [NSMutableArray array];
    
    return _posts;
}
@end
