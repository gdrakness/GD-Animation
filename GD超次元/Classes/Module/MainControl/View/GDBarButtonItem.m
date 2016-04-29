//
//  GDBarButtonItem.m
//  GD超次元
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDBarButtonItem.h"

@interface GDBarButtonItem ()

@end

@implementation GDBarButtonItem

+(instancetype)barButtonItemWithImageHighlighted:(NSString *)highlightedImg image:(NSString *)image target:(id)target action:(SEL)aciton{
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateHighlighted];
    
    button.width = 44;
    button.height = 44;
    
    [button addTarget:target action:aciton forControlEvents:UIControlEventTouchUpInside];
    
    GDBarButtonItem *item = [[GDBarButtonItem alloc]initWithCustomView:button];
    return item;
}

-(void)setWidth:(CGFloat)width{
    [super setWidth:width];
    self.customView.width = width;
}
@end
