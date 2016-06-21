//
//  GDMainViewTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;

@interface GDMainViewTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *picture;
@property(nonatomic,strong)UIView *coverView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *bluesLable;
@property(nonatomic,strong)DataModel *model;

- (CGFloat)cellOffset;
@end
