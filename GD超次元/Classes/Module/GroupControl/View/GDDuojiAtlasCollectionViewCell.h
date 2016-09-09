//
//  GDDuojiAtlasCollectionViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDoujiAtlasDataModel.h"

@interface GDDuojiAtlasCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *nameLab;

-(void)setModel:(GDDoujiAtlasRequestData *)model;
@end
