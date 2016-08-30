//
//  GDPictureViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDPictureViewController.h"
#import "LORequestManger.h"
#import "GDDetailsPictureDataModel.h"
#import "GDWaterfallPictureViewFlowLayout.h"
#import "GDPictureCollectionViewCell.h"

@interface GDPictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,GDWaterfallPictureViewFlowLayoutDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)GDDetailsPictureDataModel *dataArray;
@end

@implementation GDPictureViewController
static NSString *identifier = @"GDPictureViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getFindDataIsMore];
    [self addCollectionView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getFindDataIsMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"id"] = self.getID;
    
    [LORequestManger GET:DetailsPictureURL parame:parame success:^(id response) {
        
        GDDetailsPictureDataModel *dataModel = [GDDetailsPictureDataModel mj_objectWithKeyValues:response];
        _dataArray = dataModel;
        NSLog(@"%@",_dataArray);
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
}


-(void)addCollectionView{

    GDWaterfallPictureViewFlowLayout *laytout = [[GDWaterfallPictureViewFlowLayout alloc]init];
    laytout.columnNumber = 3;
    laytout.delegate = self;
    laytout.padding = 5;
    laytout.edgIndsets = UIEdgeInsetsMake(5, 5, 20, 5);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:laytout];
    _collectionView.backgroundColor = [UIColor colorWithRed:208 / 255.0f green:208 / 255.0f blue:208 / 255.0f alpha:0.5];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[GDPictureCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.images.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_dataArray.images[indexPath.item]]];
    [cell sizeToFit];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

-(CGFloat)WaterfallPictureViewHeightForItemAtIndex:(NSIndexPath *)index{
    
        return arc4random_uniform(20) + 100;
//    return 120;
}

@end
