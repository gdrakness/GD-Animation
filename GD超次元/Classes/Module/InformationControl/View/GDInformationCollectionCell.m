//
//  GDInformationCollectionCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformationCollectionCell.h"
#import "UIView+Roundify.h"
#import "GDInformationRequstDataModel.h"

@interface GDInformationCollectionCell ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)NSString *url;
@end

@implementation GDInformationCollectionCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 100)];
        _imageView.backgroundColor = blueColor;
        [_imageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
        [self.contentView addSubview:_imageView];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(2, 103, self.contentView.width - 2, 30)];
        _titleLable.font = [UIFont systemFontOfSize:11];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.tintColor = [UIColor darkGrayColor];
        _titleLable.numberOfLines = 0;
//        [_titleLable setText:@"夏日炎炎 正是露肉的佳季！“让人眼前一亮的二次元泳装妹纸”TOP10"];
        [self.contentView addSubview:_titleLable];
    }
    
    return self;
}

-(void)setModel:(GDInformationDataModel *)model{
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    
    _titleLable.text = model.title;
}
@end
