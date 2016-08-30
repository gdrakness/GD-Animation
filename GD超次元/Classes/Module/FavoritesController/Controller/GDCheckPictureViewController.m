//
//  GDCheckPictureViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCheckPictureViewController.h"
#import "GDCustomTransition.h"

@interface GDCheckPictureViewController ()

@end

@implementation GDCheckPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor clearColor];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 74, CGRectGetWidth(self.view.frame) - 20, 400)];
    [self.view addSubview:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[GDCustomTransition alloc] initWithTransitionType:operation == UINavigationControllerOperationPush? push :pop];
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
