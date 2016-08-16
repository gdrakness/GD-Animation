//
//  GDVideoBluesTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/31.
//  Copyright © 2016年 gdarkness. All rights reserved.
//
//<a id="dnode_7" href="javascript:;" onclick="down_process2('38943','7');" data-url="http://down2.123wzwp.com:8012/dl.php?YTM4NmFhVmtGTG92YzFCdEpPRnhIejd1aDZ1SnRLQWpVS0lKS092dDRGQWNoOWZxaVdpUDJ2dTBZdXkwUzVPeGN4akJRL1YvWVRjQzdoS0RudEtmR05PMloyZWh6V1A2MTkrdEFSVlN2UENVTnJ4S0VDUjVvK3EzcktLR08xMHFxNmRERDZRN0dxMVQ3UW14dm5JTnpxMmIra1FsWURiVFc2OXpWak1zdWtzTUJDVWZYcVc1ZkJZM2wxcDhBVjloNzV3a3VNenlqYVlROFpDdTR3Vm9oZ2dwOEU2b3VnSTJjM3JidEFITklkRXljL0tQL1ZxM3VrcXAxUzdzWG5reVZn"><span>&nbsp;普通下载</span></a>
/*
<object id="tudouHomePlayer" name="tudouHomePlayer" width="100%" height="100%" data="http://js.tudouui.com/bin/lingtong/PortalPlayer_195.swf" type="application/x-shockwave-flash"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="bgcolor" value="#000000"><param name="wMode" value="direct"><param name="quality" value="high"><param name="allowFullScreenInteractive" value="true"><param name="flashvars" value="abtest=0&amp;referrer=&amp;href=http%3A%2F%2Fwww.tudou.com%2Fprograms%2Fview%2FI0EXTJyGZqA%2F%3FresourceId%3D0_06_02_99&amp;USER_AGENT=Mozilla%2F5.0%20(Macintosh%3B%20Intel%20Mac%20OS%20X%2010_11_5)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F51.0.2704.103%20Safari%2F537.36&amp;areaCode=440400&amp;yjuid=&amp;yseid=1470506932525YgnnWv&amp;ypvid=1470506932523S6YvL9&amp;yrpvid=&amp;yrct=&amp;frame=0&amp;noCookie=0&amp;yseidtimeout=1470514132526&amp;yseidcount=2&amp;fac=0&amp;aop=0&amp;listType=0&amp;listCode=&amp;listId=0&amp;lid=0&amp;paid=&amp;paidTime=&amp;paidType=&amp;lshare=1&amp;license=&amp;tdReg=&amp;exclusive=0&amp;icode=I0EXTJyGZqA&amp;iid=219191188&amp;sp=http://g1.tdimg.com/025f0ea9ab0afbf74999a4670554dc18/m10_2.jpg&amp;segs=%7B%223%22%3A%5B%7B%22baseUrl%22%3A%22http%3A%2F%2Fv2.tudou.com%2Fx%3Fev%3D1%26expire%3D1470506931%26cks%3D8576488142d36696ea08a6affc906096%22%2C%22seconds%22%3A240090%2C%22no%22%3A0%2C%22xid%22%3A%22040003010054A5557314C3D56AADC4B9A2356C-85C7-DF96-52DE-000274639909%22%2C%22pt%22%3A3%2C%22k%22%3A274639909%2C%22size%22%3A16931495%7D%5D%2C%222%22%3A%5B%7B%22baseUrl%22%3A%22http%3A%2F%2Fv2.tudou.com%2Fx%3Fev%3D1%26expire%3D1470506931%26cks%3D239936a6d963786d9dd378b5c16092d2%22%2C%22seconds%22%3A240090%2C%22no%22%3A0%2C%22xid%22%3A%22040002010054A552CEDF455A05D0B6505364A1-4D3F-6D5A-1965-000274637640%22%2C%22pt%22%3A2%2C%22k%22%3A274637640%2C%22size%22%3A8781770%7D%5D%2C%225%22%3A%5B%7B%22baseUrl%22%3A%22http%3A%2F%2Fv2.tudou.com%2Fx%3Fev%3D1%26expire%3D1470506931%26cks%3D530ce908328ba19099810bfffb15633c%22%2C%22seconds%22%3A240090%2C%22no%22%3A0%2C%22xid%22%3A%22040005010054A559353F168E0217E7D19A4DB7-D223-3F9B-32A8-000274643343%22%2C%22pt%22%3A5%2C%22k%22%3A274643343%2C%22size%22%3A35477065%7D%5D%7D&amp;tvcCode=-1&amp;channel=9&amp;tict=3&amp;hd=3&amp;ol=0&amp;olw=-1&amp;olh=-1&amp;olr=-1&amp;kw=%E7%88%B1%C2%B7%E5%A4%A9%E5%9C%B0%E6%97%A0%E7%94%A860&amp;mediaType=vi&amp;np=0&amp;sh=0&amp;st=0&amp;videoOwner=31106583&amp;ocode=dRnHD_yMiUU&amp;time=240&amp;vcode=&amp;ymulti=&amp;lang=&amp;isFeature=0&amp;is1080p=0&amp;hasWaterMark=0&amp;actionID=0&amp;resourceId=0_06_02_99&amp;tpa=&amp;cs=&amp;k=%E7%88%B1%C2%B7%E5%A4%A9%E5%9C%B0%E6%97%A0%E7%94%A860&amp;prd=&amp;uid=0&amp;ucode=&amp;mmid=0&amp;juid=01ac20ikal335&amp;seid=01apggm69g1ejv&amp;showWS=0&amp;ahcb=0&amp;wtime=0&amp;lb=0&amp;scale=0&amp;dvd=0&amp;hideDm=0&amp;pepper=http://css.tudouui.com/bin/lingtong/pepper.swz&amp;panelEnd=http://css.tudouui.com/bin/lingtong/PanelEnd_13.swz&amp;panelRecm=http://css.tudouui.com/bin/lingtong/PanelRecm_9.swz&amp;panelShare=http://css.tudouui.com/bin/lingtong/PanelShare_7.swz&amp;panelCloud=http://css.tudouui.com/bin/lingtong/PanelCloud_12.swz&amp;panelDanmu=http://css.tudouui.com/bin/lingtong/PanelDanmu_18.swz&amp;aca="></object>
*/



#import "GDVideoBluesTableViewCell.h"
#import "GDHomeManager.h"
#import "GDVideoWebViewController.h"

@interface GDVideoBluesTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UIView *collection;
@property(nonatomic,strong)UIView *pageView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UILabel *titleArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger currentNum;
@property(nonatomic,strong)UIButton *button;
@property (nonatomic, assign) NSInteger Index;
@end

@implementation GDVideoBluesTableViewCell
static NSString * const reuseIdentifier = @"videoCollectionCell";

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 44)];
        [self.contentView addSubview:titleView];
        
        UIImageView *playImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 34, 34)];
        [playImage setImage:[UIImage imageNamed:@"tip_canPlay_recordV_high"]];
        [titleView addSubview:playImage];
        
        _titleArray = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 50, 34)];
        _titleArray.textAlignment = NSTextAlignmentLeft;
        _titleArray.font = [UIFont systemFontOfSize:14];
        [_titleArray setTextColor:[UIColor darkGrayColor]];
        [titleView addSubview:_titleArray];
        
        UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(10, 43, titleView.width - 20, 1)];
        alphaView.backgroundColor = [UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1];
        [titleView addSubview:alphaView];
        
        _collection = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.contentView.width, 190)];
//        _collection.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        [self.contentView addSubview:_collection];
        
        _pageView = [[UIView alloc]initWithFrame:CGRectMake(0, 234, self.contentView.width, 15)];
        _pageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_pageView];
        [self addCollectionView];
        
        UIView *blphaView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, _pageView.width - 20, 1)];
        blphaView.backgroundColor = [UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1];
        [_pageView addSubview:blphaView];
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((_pageView.width*0.5) - 30, 3, 60, 10)];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1];
        _pageControl.currentPageIndicatorTintColor = blueColor;
        _pageControl.backgroundColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled = NO;
        
        [_pageView addSubview:_pageControl];
    }
    return self;
}



-(void)addCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((_collection.width), (_collection.height));
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
    
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = (int)(scrollView.contentOffset.x/scrollView.frame.size.width + 0.5)%_currentIndex;
    
    self.pageControl.currentPage = page;
    
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    if (![scrollView isKindOfClass:[_collectionView class]]) {
//        
//        _pageControl.currentPage = _collectionView.contentOffset.x / _collectionView.width;
//        
//    }
//    
//}

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
   
    NSInteger Index = self.videos.count / 25;
    _currentIndex = self.videos.count % 25 == 0? Index : Index +1;
    _pageControl.numberOfPages = _currentIndex;
    return _currentIndex;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
        _currentNum = self.videos.count;
        _Index = indexPath.item;
    for (GDVideosDetailsModel *model in [self.videos reverseObjectEnumerator]) {
        if ([model.type isEqualToString:@"PV"]) {
            _currentNum = self.videos.count - 1;
        }
        [_titleArray setText:[NSString stringWithFormat:@"共%ld集",(long)_currentNum]];
//        NSLog(@"%@", model);
    }
//    // 这个有点类似sql语句
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@ or pinYin contains %@ or pinYinHead contains %@", searchText, searchText, searchText]; // name\pinYin\pinYinHead不是随便写的, 是模型中的属性; contains是包含后面%@这个字符串
//    self.resultCities = [self.cities filteredArrayUsingPredicate:predicate]; // 这个self.resultCities可以是一个不可变数组
//
        if (indexPath.item == 0) {
            
          [self createButtonWithCell:cell indexPath:indexPath currentNumber:_currentNum];
//            NSLog(@"one = %ld",_currentNum);
            return  cell;
        }else{
            
            NSInteger currentNum = _currentNum - (25 * indexPath.item);
            
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
            [self createButtonWithCell:cell indexPath:indexPath currentNumber:currentNum];
//            NSLog(@"tow = %ld",currentNum);

            return  cell;
    }
    
    
}

-(void)createButtonWithCell:(UICollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath currentNumber:(NSInteger)currentNumber{
    
    CGFloat BtnWidth = ((self.contentView.width - 60) / 5);
    CGFloat BtnHeight = (130 / 5);
    CGFloat BtnSpacint = (self.contentView.width - (5 * BtnWidth)) / (6);
    
//    if (indexPath.item) {

    for (int i = 0; i < currentNumber ; i++) {
        
        CGFloat BtnX = (BtnSpacint + (BtnSpacint + BtnWidth) - 10) * (i % 5);
        CGFloat BtnY = (BtnSpacint + (BtnSpacint + BtnHeight) - 10) * (i / 5);
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(BtnX + 10, BtnY + 10, BtnWidth, BtnHeight);
        [_button.layer setBorderWidth:1];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 158 / 255.0f, 158 / 255.0f, 158 / 255.0f, 1 });
        [_button.layer setBorderColor:colorref];
        _button.backgroundColor = [UIColor whiteColor];
        
        for (GDVideosDetailsModel *model in [self.videos reverseObjectEnumerator]) {
            if (indexPath.item == 0) {
                [_button setTitle:[NSString stringWithFormat:@"%ld",(long)model.jishu + i] forState:UIControlStateNormal];
            }
            else if (indexPath.item){
                 [_button setTitle:[NSString stringWithFormat:@"%ld",(long)model.jishu + (25 * indexPath.item + i)] forState:UIControlStateNormal];
            }
        }
        [_button setTitleColor:[UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:14];
        _button.layer.cornerRadius = 5;
        
        _button.tag = i+1;
        [_button addTarget:self action:@selector(getButtonTag:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:_button];
        }
}

-(void)getButtonTag:(UIButton *)send {
    
    NSInteger tag = (long)send.tag;
    NSIndexPath *Index = [NSIndexPath indexPathWithIndex:_Index];
    NSLog(@"index = %ld",(long)_Index);
    NSLog(@"tag = %ld",(long)tag);
    if (Index.item){
        tag = tag + 25 * _Index;
        for (GDVideosDetailsModel *model in [self.videos reverseObjectEnumerator]) {
            if (model.jishu == tag ) {
            
//                NSLog(@"---%@",model.sr);
                NSLog(@"%ld",(long)tag);
//                GDVideoWebViewController *webVC = [[GDVideoWebViewController alloc]init];
//                webVC.url = model.sr;
                if ([_delegate respondsToSelector:@selector(getVideoWebViewURL:)]) {
                    [_delegate getVideoWebViewURL:model.sr];
                }
            }
        }
    }
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
