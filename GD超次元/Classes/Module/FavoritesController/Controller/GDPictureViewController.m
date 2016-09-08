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
#import "GDProgressView.h"

@interface GDPictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,GDWaterfallPictureViewFlowLayoutDelegate>
@property(nonatomic,strong)GDDetailsPictureDataModel *dataArray;
@property(nonatomic,assign)NSInteger changeIndexPath;

@end

@implementation GDPictureViewController
static NSString *identifier = @"GDPictureViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getFindDataIsMore];
    [self addCollectionView];

    self.navigationItem.title = _titleName;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.view.frame = [UIScreen mainScreen].bounds;
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
    laytout.edgIndsets = UIEdgeInsetsMake(5, 5, 65, 5);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:laytout];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
    
     GDProgressView *progress = [[GDProgressView alloc]init];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_dataArray.images[indexPath.item]] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        cell.backgroundColor = blueColor;
        progress.frame = CGRectMake(cell.imageView.width * 0.5 - 20, cell.imageView.height * 0.5 - 20, 40, 40);
//        progress.center = cell.imageView.center;
        CGFloat currentProgress = (CGFloat)receivedSize / (CGFloat)expectedSize;
        [progress setProgress:currentProgress];
        [cell.contentView addSubview:progress];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
//        [progress removeFromSuperview];
        while ([progress.subviews lastObject] != nil) {
            [(UIView *)[progress.subviews lastObject] removeFromSuperview];
        }
        cell.backgroundColor = [UIColor clearColor];

    }];
    
    [cell sizeToFit];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDCheckPictureViewController *toVC = [[GDCheckPictureViewController alloc]init];
    [toVC.pictureArray addObjectsFromArray:_dataArray.images];
    toVC.currentIndexPath = indexPath.item;
//    _currentIndexPath = indexPath;
    toVC.indexPathBlock = ^(NSInteger indexPath){
        _changeIndexPath = indexPath;
//        NSLog(@"change = %ld",(long)_changeIndexPath);
    };
    
    
    
//    NSLog(@"%ld",(long)_currentIndexPath.item);
//    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    self.navigationController.delegate = toVC;
    [self.navigationController pushViewController:toVC animated:YES];
    
}



-(CGFloat)WaterfallPictureViewHeightForItemAtIndex:(NSIndexPath *)index{
    
        return arc4random_uniform(20) + 100;
//    return 120;
}

@end
