//
//  GDVideoBluesTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/31.
//  Copyright © 2016年 gdarkness. All rights reserved.
//
//<a id="dnode_7" href="javascript:;" onclick="down_process2('38943','7');" data-url="http://down2.123wzwp.com:8012/dl.php?YTM4NmFhVmtGTG92YzFCdEpPRnhIejd1aDZ1SnRLQWpVS0lKS092dDRGQWNoOWZxaVdpUDJ2dTBZdXkwUzVPeGN4akJRL1YvWVRjQzdoS0RudEtmR05PMloyZWh6V1A2MTkrdEFSVlN2UENVTnJ4S0VDUjVvK3EzcktLR08xMHFxNmRERDZRN0dxMVQ3UW14dm5JTnpxMmIra1FsWURiVFc2OXpWak1zdWtzTUJDVWZYcVc1ZkJZM2wxcDhBVjloNzV3a3VNenlqYVlROFpDdTR3Vm9oZ2dwOEU2b3VnSTJjM3JidEFITklkRXljL0tQL1ZxM3VrcXAxUzdzWG5reVZn"><span>&nbsp;普通下载</span></a>

#import "GDVideoBluesTableViewCell.h"
#import "GDButtonCollectionViewCell.h"

@interface GDVideoBluesTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UIView *collection;
@property(nonatomic,strong)UIView *pageView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UILabel *titleArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation GDVideoBluesTableViewCell
static NSString * const reuseIdentifier = @"videoCollectionCell";

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 44)];
//        titleView.backgroundColor = blueColor;
        [self.contentView addSubview:titleView];
        
        UIImageView *playImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 34, 34)];
        [playImage setImage:[UIImage imageNamed:@"tip_canPlay_recordV_high"]];
        [titleView addSubview:playImage];
        
        _titleArray = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 50, 34)];
        _titleArray.textAlignment = NSTextAlignmentLeft;
        _titleArray.font = [UIFont systemFontOfSize:14];
        [_titleArray setTextColor:[UIColor blackColor]];
        [_titleArray setText:@"24集全"];
        [titleView addSubview:_titleArray];
        
        UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(10, 43, titleView.width - 15, 1)];
        alphaView.backgroundColor = [UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1];
        [titleView addSubview:alphaView];
        
        _collection = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.contentView.width, 190)];
//        _collection.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        [self.contentView addSubview:_collection];
        
        _pageView = [[UIView alloc]initWithFrame:CGRectMake(0, 234, self.contentView.width, 15)];
        _pageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_pageView];
        [self addCollectionView];
    }
    return self;
}

-(void)addCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((_collection.width), (_collection.height));
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 5;
//    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, _collection.width, _collection.height) collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_collectionView registerClass:[GDButtonCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.pagingEnabled = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
//    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:0 inSection:0];
//    [_collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    [_collection addSubview:_collectionView];
}

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    
//    NSInteger offset = _collectionView.contentOffset.x / _collectionView.width - 1;
//    if (offset == 0) return;
//    _currentIndex = (_currentIndex + offset + 3) % 3;

//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
//    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//    [UIView setAnimationsEnabled:NO];
//    [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
//    [UIView setAnimationsEnabled:YES];
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    switch (indexPath.item) {
        case 0:
//            cell.backgroundColor = [UIColor redColor];
            break;
        case 1:
//            cell.backgroundColor = [UIColor greenColor];
            break;
        case 2:
//            cell.backgroundColor = [UIColor grayColor];
            break;
    }
    
    return  cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
