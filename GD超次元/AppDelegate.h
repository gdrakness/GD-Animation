//
//  AppDelegate.h
//  GD超次元
//
//  Created by gdarkness on 16/4/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AppDelegateAccessor ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@class CEReversibleAnimationController, CEBaseInteractionController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

