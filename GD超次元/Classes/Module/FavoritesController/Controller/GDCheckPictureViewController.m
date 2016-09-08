//
//  GDCheckPictureViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCheckPictureViewController.h"
#import "GDPictureViewController.h"
#import "GDCustomTransition.h"
#import "GDCheckPictureCollectionViewCell.h"
#import "GDProgressView.h"
#import "GDDetailsPictureDataModel.h"
#import "CoreSVP.h"
#import "UIImage+Extend.h"
#import "ZBFallenBricksAnimator.h"

@interface GDCheckPictureViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong)UIView *topBarView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *saveBtn;
@property (nonatomic, assign) BOOL hasImage;
@property (nonatomic, weak) GDCheckPictureCollectionViewCell *currentPictureURL;
@property(nonatomic,strong)UIImageView *currentPicture;
@end

@implementation GDCheckPictureViewController
static NSString *Identifier = @"GDCheckPictureViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
//    self.navigationController.navigationBar.translucent = NO;
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.indexPathBlock(_currentIndexPath);
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareUI{
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.delegate = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:_currentIndexPath inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
//    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%lu",_currentIndexPath,(unsigned long)_pictureArray.count];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
    
    _topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 62)];
    _topBarView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width *0.5 - 40, 25, 80, 30)];
    [_titleLab setText:[NSString stringWithFormat:@"%ld/%lu",_currentIndexPath + 1,(unsigned long)_pictureArray.count]];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_titleLab setTextColor:blueColor];
    [_titleLab setFont:[UIFont systemFontOfSize:24]];
    
    _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    [_backBtn setImage:[UIImage imageNamed:@"sp_back@2x"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(popViewControlleAction) forControlEvents:UIControlEventTouchUpInside];
    
    _saveBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.85, 20, 40, 40)];
    [_saveBtn setImage:[UIImage imageNamed:@"Setting-Download-icon_ipad"] forState:UIControlStateNormal];
    [_saveBtn addTarget:self action:@selector(savePictureAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_topBarView addSubview:_titleLab];
    [_topBarView addSubview:_saveBtn];
    [_topBarView addSubview:_backBtn];
    
    [self.view addSubview:_topBarView];
}

-(void)popViewControlleAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)savePictureAction:(id)send{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.pictureArray[_currentIndexPath]]];
    UIImage *image = [UIImage imageWithData:data];
    [CoreSVP showSVPWithType:CoreSVPTypeLoadingInterface Msg:@"图片保存中..." duration:1.0f allowEdit:NO beginBlock:nil completeBlock:nil];
    
    [self saveImageToPhotos:image];
    
    if (!_hasImage) {
        [CoreSVP showSVPWithType:CoreSVPTypeError Msg:@"无图片数据" duration:1.0f allowEdit:NO beginBlock:nil completeBlock:nil];
        return;
    }
//    if ([itemModel readLocalImage]) {
//        [CoreSVP showSVPWithType:CoreSVPTypeInfo Msg:@"图片已存在" duration:1.0f allowEdit:NO beginBlock:nil completeBlock:nil];
//    }else{
}

- (void)saveImageToPhotos:(UIImage*)savedImage{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    
    if (error != NULL) {
       [CoreSVP showSVPWithType:CoreSVPTypeError Msg:@"保存失败" duration:1.0f allowEdit:NO beginBlock:nil completeBlock:nil];
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [CoreSVP showSVPWithType:CoreSVPTypeSuccess Msg:@"保存成功" duration:1.0f allowEdit:NO beginBlock:nil completeBlock:nil];
        });
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {

        NSObject <UIViewControllerAnimatedTransitioning> *animator;
        // create
        animator = [[ZBFallenBricksAnimator alloc] init];
        return animator;
    
//    return [[GDCustomTransition alloc] initWithTransitionType:operation == UINavigationControllerOperationPush? push :pop];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _pictureArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    GDCheckPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
//    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.currentPicture = [self.pictureArray objectAtIndex:_currentIndexPath];
    
    GDProgressView *progress = [[GDProgressView alloc]init];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_pictureArray[indexPath.item]] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        progress.frame = CGRectMake(cell.imageView.width * 0.5 - 25, cell.imageView.height * 0.5 - 25, 50, 50);
        //        progress.center = cell.imageView.center;
        CGFloat currentProgress = (CGFloat)receivedSize / (CGFloat)expectedSize;
        [progress setProgress:currentProgress];
        [cell.contentView addSubview:progress];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.hasImage = cell.imageView !=nil;
        
        while ([progress.subviews lastObject] != nil) {
            [(UIView *)[progress.subviews lastObject] removeFromSuperview];
        }
        if (error) {
            self.hasImage = YES;
        }
        
    }];
    
    cell.itemViewFullBlock = ^(){
        [self fullViewMethod];
    };
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    [UIView animateWithDuration:0.25f animations:^{
//        self.navigationController.navigationBar.hidden = NO;
//    } completion:^(BOOL finished) {
//        for (UIView *view in self.navigationController.navigationBar.subviews) {
//            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
//                UIView *overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width,20)];
//                overlay.backgroundColor = [UIColor redColor];
//                [self.navigationController.navigationBar insertSubview:overlay atIndex:0];
//            }
//        }
//        self.navigationController.navigationBar.hidden = YES;
//        UIWindow *windown = self.view.window;
//        self.collectionView.frame = [UIScreen mainScreen].bounds;
//        [windown addSubview:self.collectionView];
//
//    }];
//
//
//    NSLog(@" %d",flag);
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger offsetX = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
    NSInteger currentCount = /* DISABLES CODE */ (0) ? _currentIndexPath : offsetX;
//    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%lu",(long)currentCount,(unsigned long)_pictureArray.count];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
    [_titleLab setText:[NSString stringWithFormat:@"%ld/%lu",(long)currentCount + 1,(unsigned long)_pictureArray.count]];
}


-(void)fullViewMethod{
    
    CGFloat height = _topBarView.frame.size.height;
    [UIView animateWithDuration:.25f animations:^{
        _topBarView.height = 0;
        _backBtn.height = 0;
        _titleLab.height = 0;
        _saveBtn.height = 0;
    }];
    if (height == 0) {
        [UIView animateWithDuration:.25f animations:^{
            
            _topBarView.height = 64;
            _backBtn.height = 30;
            _titleLab.height = 30;
            _saveBtn.height = 40;
        }];
    }
}


-(UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height) - 70);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_collectionView registerClass:[GDCheckPictureCollectionViewCell class] forCellWithReuseIdentifier:Identifier];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

-(NSMutableArray *)pictureArray{
    if (_pictureArray != nil) {
        return _pictureArray;
    }
    //实例化
    _pictureArray = [NSMutableArray array];
    
    return _pictureArray;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
