//
//  GDParallaxLeaderBoradTableViwCell.h
//  GD超次元
//
//  Created by gdarkness on 16/8/19.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDParallaxTableViewCell.h"

@interface GDParallaxLeaderBoradTableViwCell : GDParallaxTableViewCell

@property(nonatomic,strong)UIImageView *pictureView;
@property(nonatomic,strong)UILabel *titleLab;

-(void)setModel:(GDLeaderBoardRequestData *)model;


+(CGFloat)getHeight;
@end
