//
//  GDGDDoujiDetailsTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDoujiDetailsDataModel.h"

@interface GDGDDoujiDetailsTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *pictureView;
@property(nonatomic,strong)UILabel *titleLab;

-(void)setModel:(GDDoujiDetailsRequestData *)model;

+(CGFloat)getHeight;
@end
