//
//  UIView+Roundify.h
//  GD超次元
//
//  Created by gdarkness on 16/7/7.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Roundify)

-(void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii;
-(CALayer*)maskForRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii;

+(CGRect)frameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center;
@end
