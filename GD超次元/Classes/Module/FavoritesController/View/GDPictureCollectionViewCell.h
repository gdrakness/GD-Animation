//
//  GDPictureCollectionViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDetailsPictureDataModel.h"
#import "GDDetailsPictureDataModel.h"

@interface GDPictureCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *imageView;
-(void)setModel:(GDDetailsPictureDataModel *)model indexPath:(NSIndexPath *)indexPath;
@end
