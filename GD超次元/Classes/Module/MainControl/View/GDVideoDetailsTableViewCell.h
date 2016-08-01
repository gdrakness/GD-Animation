//
//  GDVideoDetailsTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/6/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDetailsDataModel.h"
@class GDDetailsDataModel;
@interface GDVideoDetailsTableViewCell : UITableViewCell

@property(nonatomic,copy)NSString *url;
-(void)setModel:(GDDetailsDataModel *)model;
@end
