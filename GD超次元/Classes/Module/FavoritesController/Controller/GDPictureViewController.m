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

@interface GDPictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation GDPictureViewController
static NSString *identifier = @"GDPictureViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addCollectionView];
    [self getFindDataIsMore];
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
        NSLog(@"%@",dataModel);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


-(void)addCollectionView{

    UICollectionViewFlowLayout *flowLaytout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLaytout];
    _collectionView.backgroundColor = [UIColor colorWithRed:208 / 255.0f green:208 / 255.0f blue:208 / 255.0f alpha:0.5];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

@end
