//
//  GDDuojiAtlasCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDuojiAtlasCollectionViewCell.h"
#import "UIView+Roundify.h"

@implementation GDDuojiAtlasCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self prepareUI];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self prepareUI];
    }
    return self;
}

-(void)prepareUI{
    
    _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    [_imageView addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(10, 10)];
    [self.contentView addSubview:_imageView];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(self.contentView.width * 0.5 - 30, self.contentView.height * 0.5 - 30 , 60, 60)];
    _nameLab.numberOfLines = 0;
    _nameLab.font = [UIFont boldSystemFontOfSize:20];
    _nameLab.textAlignment = NSTextAlignmentCenter;
    _nameLab.textColor = [UIColor whiteColor];
    _nameLab.shadowColor = [UIColor grayColor];
    _nameLab.shadowOffset = CGSizeMake(1, 1);
    [self.contentView addSubview:_nameLab];
}

-(void)setModel:(GDDoujiAtlasRequestData *)model{
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.coverImage]];
    
    [_nameLab setText:model.name];
}
@end
