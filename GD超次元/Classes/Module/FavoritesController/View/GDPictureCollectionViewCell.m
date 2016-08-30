//
//  GDPictureCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDPictureCollectionViewCell.h"
#import "UIView+Roundify.h"

@interface GDPictureCollectionViewCell ()
@end

@implementation GDPictureCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
       
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        [_imageView addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(5, 5)];
        [self.contentView addSubview:_imageView];

    }
    return self;
}

@end
