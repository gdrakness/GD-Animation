//
//  GDCustomTransition.m
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCustomTransition.h"
#import "GDPictureViewController.h"

@interface GDCustomTransition ()
@property (nonatomic, assign) TransitionType type;
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
}

-(void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}
@end
