//
//  GDInformatTabbleBigPictureCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDInformationDataModel;

@interface GDInformatTableBigPictureCell : UITableViewCell
@property(nonatomic,strong)GDInformationDataModel *model;

-(void)setModel:(GDInformationDataModel *)model;

+(CGFloat)getCellHeight;

@end
