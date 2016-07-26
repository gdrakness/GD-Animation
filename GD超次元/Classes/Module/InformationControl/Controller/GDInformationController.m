//
//  GDInformationController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformationController.h"

#import "GDInformationCollectionCell.h"

@interface GDInformationController ()
@property(nonatomic,strong)UISegmentedControl *segmented;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UIView *showView;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation GDInformationController
static NSString *Identifier = @"GDInformationTableViewCell";
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
            break;
    }
}



-(void)addTableView{
    
    [_collectionView removeFromSuperview];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.width, self.view.height)];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
}

-(void)addCollectionView{
    
    [_tableView removeFromSuperview];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((WIDTH - 30) / 2, (HEIGHT - 200) / 2);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 45, self.view.width, self.view.height) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorWithRed:208 / 255.0f green:208 / 255.0f blue:208 / 255.0f alpha:0.5];
;
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[GDInformationCollectionCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_collectionView];
    
}


/***********************TableView************************/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    cell.backgroundColor = blueColor;
    return cell;
}

/***********************CollectionView************************/

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDInformationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 5;
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
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

@end
