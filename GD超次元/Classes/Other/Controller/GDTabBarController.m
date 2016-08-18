//
//  GDTabBarController.m
//  GD超次元
//
//  Created by gdarkness on 16/6/17.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTabBarController.h"

#import "GDMainViewController.h"
#import "GDCompositorTableViewController.h"
#import "GDClassViewController.h"
#import "GDInformationController.h"
#import "GDGroupViewController.h"

#import "GDBarButtonItem.h"
#import "GDTimetableController.h"
#import "GDSetingViewController.h"
#import "GDSearchViewController.h"
#import "GDFavritesViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

#import "CEHorizontalSwipeInteractionController.h"
#import "CEFoldAnimationController.h"//折纸
#import "CECardsAnimationController.h"//推进
#import "CECrossfadeAnimationController.h"//渐变
#import "CECubeAnimationController.h"//3D立体
#import "CEExplodeAnimationController.h"//碎片
#import "CEFlipAnimationController.h"//翻页
#import "CENatGeoAnimationController.h"//移走
#import "CEPanAnimationController.h"//侧移
#import "CEPortalAnimationController.h"//百合门
#import "CEReversibleAnimationController.h"
#import "CETurnAnimationController.h"//翻转

@interface GDTabBarController ()<UITabBarControllerDelegate>

@end

@implementation GDTabBarController{
CEExplodeAnimationController *_animationController;
CEHorizontalSwipeInteractionController *_swipeInteractionController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation];
    self.tabBar.hidden = YES;
//    [self setTabBarController];
    [self addChildViewController:[GDMainViewController pageControlStyleFlood]];
    
    self.delegate = self;
    
    // create the interaction / animation controllers
    _swipeInteractionController = [CEHorizontalSwipeInteractionController new];
    _animationController = [CEExplodeAnimationController new];
//    _animationController.folds = 3;
    
    // observe changes in the currently presented view controller
    [self addObserver:self
           forKeyPath:@"selectedViewController"
              options:NSKeyValueObservingOptionNew
              context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"selectedViewController"] )
    {
        // wire the interaction controller to the view controller
        [_swipeInteractionController wireToViewController:self.selectedViewController
                                             forOperation:CEInteractionOperationTab];
    }
}



- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC {
    
    NSUInteger fromVCIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSUInteger toVCIndex = [tabBarController.viewControllers indexOfObject:toVC];
    
    _animationController.reverse = fromVCIndex < toVCIndex;
    return _animationController;
}

-(id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return _swipeInteractionController.interactionInProgress ? _swipeInteractionController : nil;
}
-(void)setTabBarController{
    
    [self setChildViewController:[[GDCompositorTableViewController alloc]init] title:@"动画排行" image:@"tabADeselected" selectedImage:@"tabASelected"];
    [self setChildViewController:[[GDClassViewController alloc]init] title:@"分类推荐" image:@"tabBDeselected" selectedImage:@"tabBSelected"];
    [self setChildViewController:[[GDMainViewController alloc]init] title:@"新番速递" image:@"tabCDeselected" selectedImage:@"tabCSelected"];
    [self setChildViewController:[[GDInformationController alloc]init] title:@"动漫资讯" image:@"tabDDeselected" selectedImage:@"tabDSelected"];
}

-(void)setChildViewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    childViewController.title = title;
    [childViewController.tabBarItem setImage:[UIImage imageNamed:image]];
    
    UIImage *select = [UIImage imageNamed:selectedImage];
    childViewController.tabBarItem.selectedImage = [select imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    [childViewController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    
    [self addChildViewController:childViewController];
    
}

-(void)setNavigation{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 45)];
    imageView.image = [UIImage imageNamed:@"new_logo"];
    
    self.navigationItem.titleView = imageView;
    
    GDBarButtonItem *settingItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"set_hover@2x" image:@"set@2x" target:self action:@selector(settingAction:)];
    
    GDBarButtonItem *searchItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"glass_hover@2x" image:@"glass@2x" target:self action:@selector(searchAction:)];
    
    self.navigationItem.leftBarButtonItems = @[settingItem,searchItem,];
    
    GDBarButtonItem *scheduleItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"clock_hover@2x" image:@"clock@2x" target:self action:@selector(scheduleAction:)];
    
    GDBarButtonItem *collectionItem = [GDBarButtonItem barButtonItemWithImageHighlighted:@"sc_hover@2x" image:@"sc@2x" target:self action:@selector(favoritesAction:)];
    
    self.navigationItem.rightBarButtonItems = @[collectionItem,scheduleItem];
    
}

-(void)searchAction:(id)sender{
    
    GDSearchViewController *searchVC = [[GDSearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

-(void)settingAction:(id)sender{
//    NSLog(@"%s",__func__);
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)scheduleAction:(id)sender{
//    NSLog(@"%s",__func__);
   GDTimetableController *Timevc =  [[GDTimetableController alloc]init];
    [self.navigationController pushViewController:Timevc animated:YES];
}

-(void)favoritesAction:(id)sender{
//    NSLog(@"%s",__func__);
    GDFavritesViewController *favoritesVC = [[GDFavritesViewController alloc]init];
    [self.navigationController pushViewController:favoritesVC animated:YES];
    
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
