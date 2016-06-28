

//
//  GDInformationTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformationTableViewCell.h"

@interface GDInformationTableViewCell ()
@property(nonatomic,strong)UIImageView *topView;
@property(nonatomic,strong)UIImageView *firstCoverView;
@property(nonatomic,strong)UIImageView *secondCoverView;
@property(nonatomic,strong)UIImageView *thirdlyCoverView;
@end

@implementation GDInformationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _topView = [UIImageView ]
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
