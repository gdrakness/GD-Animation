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

@interface GDCheckPictureViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@end

@implementation GDCheckPictureViewController
static NSString *Identifier = @"GDCheckPictureViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:_currentIndexPath inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%lu",_currentIndexPath,(unsigned long)_pictureArray.count];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.indexPathBlock(_currentIndexPath);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[GDCustomTransition alloc] initWithTransitionType:operation == UINavigationControllerOperationPush? push :pop];
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
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_pictureArray[indexPath.item]]];

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    [UIView animateWithDuration:0.25f animations:^{
//        self.navigationController.navigationBar.hidden = NO;
//    } completion:^(BOOL finished) {
////        for (UIView *view in self.navigationController.navigationBar.subviews) {
////            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
////                UIView *overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width,20)];
////                overlay.backgroundColor = [UIColor redColor];
////                [self.navigationController.navigationBar insertSubview:overlay atIndex:0];
////            }
////        }
//        self.navigationController.navigationBar.hidden = YES;
//        UIWindow *windown = self.view.window;
//        self.collectionView.frame = [UIScreen mainScreen].bounds;
//        [windown addSubview:self.collectionView];
//        
//    }];
//    
//    BOOL flag =  +1;
//    
//    NSLog(@" %d",flag);
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger offsetX = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
    NSInteger currentCount = /* DISABLES CODE */ (0) ? _currentIndexPath : offsetX;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%lu",(long)currentCount,(unsigned long)_pictureArray.count];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
}





-(UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((WIDTH ), (HEIGHT));
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:layout];
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
