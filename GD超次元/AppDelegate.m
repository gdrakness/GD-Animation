//
//  AppDelegate.m
//  GD超次元
//
//  Created by gdarkness on 16/4/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "AppDelegate.h"
#import "GDMainViewController.h"
#import "GDSetingViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong)MMDrawerController  *drawerControl;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *mainView = [GDMainViewController new];
    
    UIViewController *leftView = [[GDSetingViewController alloc]init];
    
    UINavigationController *mainNavC = [[UINavigationController alloc]initWithRootViewController:mainView];
    UINavigationController *leftNavC = [[UINavigationController alloc]initWithRootViewController:leftView];
    
    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    
    
    self.drawerControl = [[MMDrawerController alloc]initWithCenterViewController:mainNavC leftDrawerViewController:leftNavC];
    
    self.drawerControl.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerControl.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    self.drawerControl.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width * 0.8;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:self.drawerControl];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
