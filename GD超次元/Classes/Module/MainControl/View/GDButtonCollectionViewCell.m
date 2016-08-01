
//
//  GDButtonCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDButtonCollectionViewCell.h"

@implementation GDButtonCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        CGFloat BtnWidth = ((self.contentView.width - 60) / 5);
        CGFloat BtnHeight = (130 / 5);
        CGFloat BtnSpacint = (self.contentView.width - (5 * BtnWidth)) / (6);
        
        for (int i = 0; i < 25; i++) {
            
            CGFloat BtnX = (BtnSpacint + (BtnSpacint + BtnWidth) - 10) * (i % 5);
            CGFloat BtnY = (BtnSpacint + (BtnSpacint + BtnHeight) - 10) * (i / 5);
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(BtnX + 10, BtnY + 10, BtnWidth, BtnHeight);
            [button.layer setBorderWidth:1];
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 158 / 255.0f, 158 / 255.0f, 158 / 255.0f, 1 });
            [button.layer setBorderColor:colorref];
            button.backgroundColor = [UIColor whiteColor];
            
            [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:164 / 255.0f green:164 / 255.0f blue:164 / 255.0f alpha:1] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.layer.cornerRadius = 5;
            [self.contentView addSubview:button];
        }
        
    }
    return self;
}
@end
