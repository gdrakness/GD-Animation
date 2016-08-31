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
#import "UIImageView+WebCache.h"
#import "GDCheckPictureViewController.h"

@interface GDPictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,GDWaterfallPictureViewFlowLayoutDelegate>
@property(nonatomic,strong)GDDetailsPictureDataModel *dataArray;
@property(nonatomic,strong)UIProgressView *progress;
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
//        NSLog(@"%@",_dataArray);
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
    _collectionView.backgroundColor = [UIColor whiteColor];
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
    
    _progress = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];

    
    __weak typeof(self) weakSelf=self;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_dataArray.images[indexPath.item]] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        cell.backgroundColor = blueColor;
        weakSelf.progress.frame = CGRectMake(5, 0, cell.imageView.width - 5, 5);
        weakSelf.progress.center = cell.imageView.center;
        CGFloat currentProgress = (CGFloat)receivedSize / (CGFloat)expectedSize;
        weakSelf.progress.progress = currentProgress;
        [cell.imageView addSubview:weakSelf.progress];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        [weakSelf.progress removeFromSuperview];
        cell.backgroundColor = [UIColor clearColor];

    }];
    [_progress removeFromSuperview];
    [cell sizeToFit];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDCheckPictureViewController *toVC = [[GDCheckPictureViewController alloc]init];
    GDPictureCollectionViewCell *cell = (GDPictureCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [toVC.view addSubview:cell.imageView];
    _currentIndexPath = indexPath;
    self.navigationController.delegate = toVC;
    [self.navigationController pushViewController:toVC animated:YES];
    
}

-(CGFloat)WaterfallPictureViewHeightForItemAtIndex:(NSIndexPath *)index{
    
        return arc4random_uniform(20) + 100;
//    return 120;
}

@end
