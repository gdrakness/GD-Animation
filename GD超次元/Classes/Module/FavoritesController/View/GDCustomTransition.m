//
//  GDCustomTransition.m
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCustomTransition.h"
#import "GDPictureViewController.h"
#import "GDCheckPictureViewController.h"
#import "GDPictureCollectionViewCell.h"

@interface GDCustomTransition ()
@property (nonatomic, assign) TransitionType type;
@property(nonatomic,strong)UIView *bgView;
@end

@implementation GDCustomTransition

-(instancetype)initWithTransitionType:(TransitionType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case push:
            [self pushAnimation:transitionContext];
            break;
        case pop:
            [self popAnimation:transitionContext];
            break;
    }
}

-(void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    GDPictureViewController *fromeVC = (GDPictureViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    GDCheckPictureViewController *toVC = (GDCheckPictureViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    GDPictureCollectionViewCell *cell = (GDPictureCollectionViewCell *)[fromeVC.collectionView cellForItemAtIndexPath:fromeVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    UIView *tempView = [cell snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [cell convertRect:cell.contentView.bounds toView:containerView];
    
    cell.hidden = YES;
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
//        toVC.view.alpha = 1;
//    } completion:^(BOOL finished) {
//        tempView.hidden = YES;
//        toVC.imageView.hidden = NO;
//        [transitionContext completeTransition:YES];
//    }];
    
    CGFloat timeInterval = .52f;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:timeInterval-.3f animations:^{
            self.bgView.alpha = 1;
            self.bgView.backgroundColor = [UIColor blackColor];
        }];
    });
    
    [UIView animateWithDuration:timeInterval delay:0 usingSpringWithDamping:.52f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toVC.imageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

-(void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    GDCheckPictureViewController *fromeVC = (GDCheckPictureViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    GDPictureViewController *toVC = (GDPictureViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    GDPictureCollectionViewCell *cell = (GDPictureCollectionViewCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    UIView *tempView = containerView.subviews.lastObject;
    
    cell.hidden = YES;
    fromeVC.imageView.hidden = YES;
    tempView.hidden = NO;
    [containerView insertSubview:toVC.view atIndex:0];
    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        tempView.frame = [cell.contentView convertRect:cell.contentView.bounds toView:containerView];
//        fromeVC.view.alpha = 0;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        if ([transitionContext transitionWasCancelled]) {
//            tempView.hidden = YES;
//            fromeVC.imageView.hidden = NO;
//        }else{
//            cell.hidden = NO;
//            [tempView removeFromSuperview];
//        }
//    }];
    
    [UIView animateWithDuration:.5f delay:0 usingSpringWithDamping:.6f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        tempView.frame = [cell.contentView convertRect:cell.contentView.bounds toView:containerView];
        fromeVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            tempView.hidden = YES;
            fromeVC.imageView.hidden = NO;
        }else{
            cell.hidden = NO;
            [tempView removeFromSuperview];
        }

    }];
}
@end
