

//
//  GDTimeCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/11.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTimeCollectionViewCell.h"
#import "GDTimeTableModel.h"

@interface GDTimeCollectionViewCell()
//@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UILabel *Aname;
@property(nonatomic,strong)UIImageView *image;
@end

@implementation GDTimeCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _Aname = [[UILabel alloc]initWithFrame:CGRectMake(-1, 95, 65, 15)];
        _Aname.font = [UIFont systemFontOfSize:10];
        _Aname.textAlignment = NSTextAlignmentCenter;
        _Aname.textColor = [UIColor blackColor];
        [self.contentView addSubview:_Aname];
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 90)];
        _image.backgroundColor = blueColor;
        [self.contentView addSubview:_image];
    }
    
    return  self;
}

-(void)setModel:(GDTimeTableDescModel *)model{
    
    [_image sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    
    _Aname.text = model.name;
}



@end
