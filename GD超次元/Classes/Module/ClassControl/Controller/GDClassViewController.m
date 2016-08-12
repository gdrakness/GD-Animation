

//
//  GDClassViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDClassViewController.h"
#import "GDHomeManager.h"
#import "GDCompositorDataModel.h"
#import "GDClassRequstDataModel.h"
#import "GDClassCollectionViewCell.h"

@class ClassDataModel;
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@interface GDClassViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray<ClassDataModel *> *data;
@end

@implementation GDClassViewController

static NSString * const reuseIdentifier = @"calssCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
    [self getDataIsMore:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GDClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    ClassDataModel *cellItem = self.data[indexPath.item];
    
    [cell setModel:cellItem];
    
    cell.layer.cornerRadius = 10;
    
    [cell sizeToFit];
    
    return cell;
}

-(void)getDataIsMore:(BOOL)isMore{
    
    [[GDHomeManager shareInstance]getFindClassRequstWithURL:nil success:^(GDClassRequstDataModel *classDataModel) {
        
        if (!isMore) {
            //如果不是更多,则清空原来数据
            [self.data removeAllObjects];
        }
//        NSLog(@"%@",classDataModel);
        [self.data addObjectsFromArray:classDataModel.data];
        
        NSLog(@"%@",self.data);
        
        [self.collectionView reloadData];
        
    } error:^(NSError *error) {
        
    }];
}

-(NSMutableArray<ClassDataModel *> *)data{
    
    if (_data != nil) {
        return _data;
    }
    //实例化
    _data = [NSMutableArray array];
    
    return _data;
}

-(UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((WIDTH - 20) / 3, (WIDTH + 54) / 3);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(5, 5, WIDTH - 10, HEIGHT) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_collectionView registerClass:[GDClassCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

@end
