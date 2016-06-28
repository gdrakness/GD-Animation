//
//  GDVideoDetailsTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/6/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDetailsDataModel.h"

@interface GDVideoDetailsTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *picture;
@property(nonatomic,strong)NSString *aniName;
@property (nonatomic, assign) NSInteger stars_count;
@property(nonatomic,strong)NSString *cast;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)GDDetailsDataModel *model;

@end
