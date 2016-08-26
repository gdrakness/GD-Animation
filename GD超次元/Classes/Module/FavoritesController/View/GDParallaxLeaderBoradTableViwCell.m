//
//  GDParallaxLeaderBoradTableViwCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/19.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDParallaxLeaderBoradTableViwCell.h"

@interface GDParallaxLeaderBoradTableViwCell ()
@property(nonatomic,strong)UIView *containerView;
@end

@implementation GDParallaxLeaderBoradTableViwCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self prepareUI];
    }
    return self;
}

-(void)prepareUI{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [[self class] getHeight])];
    containerView.clipsToBounds = YES;
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    
    _pictureView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    _pictureView.contentMode = UIViewContentModeScaleAspectFill;
    [containerView addSubview:_pictureView];
    self.contentView.clipsToBounds = YES;
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, [[self class] getHeight]/2 - 40, [UIScreen mainScreen].bounds.size.width - 40, 80)];
    _titleLab.numberOfLines = 0;
    _titleLab.font = [UIFont boldSystemFontOfSize:20];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.textColor = [UIColor whiteColor];
    _titleLab.shadowColor = [UIColor grayColor];
    _titleLab.shadowOffset = CGSizeMake(1, 1);
    [self.contentView addSubview:_titleLab];
}

-(void)setModel:(GDLeaderBoardRequestData *)model{
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:model.coverImage]];
    
    [_titleLab setText:model.title];
}




+(CGFloat)getHeight{
    
    return 153;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
