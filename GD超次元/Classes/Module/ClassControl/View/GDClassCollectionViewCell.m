//
//  GDClassCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDClassCollectionViewCell.h"
//#import "GDClassRequstDataModel.h"


@interface GDClassCollectionViewCell ()
@property(nonatomic,strong)UIImageView *picture;
@property(nonatomic,strong)UIView *alphaView;
@property(nonatomic,strong)UILabel *titleLable;
@end

@implementation GDClassCollectionViewCell


- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _picture.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_picture];
        
        _alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 25)];
//        _alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        _alphaView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_alphaView];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
        _titleLable.font = [UIFont systemFontOfSize:13];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = [UIColor blackColor];
        [_alphaView addSubview: _titleLable];
    }
    
    return self;
}

-(void)setModel:(ClassDataModel *)model{
        
    [_picture sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];

    _titleLable.text = model.name;
}
@end
