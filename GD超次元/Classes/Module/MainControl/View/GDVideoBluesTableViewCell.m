//
//  GDVideoBluesTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/31.
//  Copyright © 2016年 gdarkness. All rights reserved.
//
//<a id="dnode_7" href="javascript:;" onclick="down_process2('38943','7');" data-url="http://down2.123wzwp.com:8012/dl.php?YTM4NmFhVmtGTG92YzFCdEpPRnhIejd1aDZ1SnRLQWpVS0lKS092dDRGQWNoOWZxaVdpUDJ2dTBZdXkwUzVPeGN4akJRL1YvWVRjQzdoS0RudEtmR05PMloyZWh6V1A2MTkrdEFSVlN2UENVTnJ4S0VDUjVvK3EzcktLR08xMHFxNmRERDZRN0dxMVQ3UW14dm5JTnpxMmIra1FsWURiVFc2OXpWak1zdWtzTUJDVWZYcVc1ZkJZM2wxcDhBVjloNzV3a3VNenlqYVlROFpDdTR3Vm9oZ2dwOEU2b3VnSTJjM3JidEFITklkRXljL0tQL1ZxM3VrcXAxUzdzWG5reVZn"><span>&nbsp;普通下载</span></a>

#import "GDVideoBluesTableViewCell.h"
#import "GDHomeManager.h"

@interface GDVideoBluesTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UIView *collection;
@property(nonatomic,strong)UIView *pageView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UILabel *titleArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger currentNum;
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
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((_pageView.width*0.5) - 30, 3, 60, 10)];
        [_pageView addSubview:_pageControl];
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
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
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
   
    if (self.videos.count >= 25) {
        return 1;
    }
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//     GDVideosDetailsModel*cellItem = [self.videos reverseObjectEnumerator];
    
//    NSLog(@"%@",cellItem);
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    for (GDVideosDetailsModel *model in [self.videos reverseObjectEnumerator]) {
        if ([model.type isEqualToString:@"PV"]) {
            _currentNum ++;
        }
//        NSLog(@"%@", model);
    }
    
    CGFloat BtnWidth = ((self.contentView.width - 60) / 5);
    CGFloat BtnHeight = (130 / 5);
    CGFloat BtnSpacint = (self.contentView.width - (5 * BtnWidth)) / (6);
    
//    // 这个有点类似sql语句
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@ or pinYin contains %@ or pinYinHead contains %@", searchText, searchText, searchText]; // name\pinYin\pinYinHead不是随便写的, 是模型中的属性; contains是包含后面%@这个字符串
//    self.resultCities = [self.cities filteredArrayUsingPredicate:predicate]; // 这个self.resultCities可以是一个不可变数组
//
    
    NSLog(@"%ld",(long)_currentNum);
        for (int i = 0; i < (self.videos.count - _currentNum) ; i++) {
            
            CGFloat BtnX = (BtnSpacint + (BtnSpacint + BtnWidth) - 10) * (i % 5);
            CGFloat BtnY = (BtnSpacint + (BtnSpacint + BtnHeight) - 10) * (i / 5);
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(BtnX + 10, BtnY + 10, BtnWidth, BtnHeight);
            [button.layer setBorderWidth:1];
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 158 / 255.0f, 158 / 255.0f, 158 / 255.0f, 1 });
            [button.layer setBorderColor:colorref];
            button.backgroundColor = [UIColor whiteColor];
            
            [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.layer.cornerRadius = 5;
            
            button.tag ++;
            [cell.contentView addSubview:button];
    }
//    [collectionView reloadData];
    return  cell;
}

-(NSMutableArray<GDVideosDetailsModel *> *)videos{
    
    if (_videos != nil) {
        return _videos;
    }
    //实例化
    _videos = [NSMutableArray array];
    [[GDHomeManager shareInstance]getDetailsBluesWithURL:_url success:^(GDDetailBluesDataModel *detailsData) {
        
        [_videos addObjectsFromArray:detailsData.videos];
        [self.collectionView reloadData];
//        NSLog(@"%@",_videos);
        
    } error:^(NSError *error) {
        
    }];
    
    return _videos;
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
