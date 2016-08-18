//
//  GDLerderBoradTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/19.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDLerderBoradTableViewCell.h"

@interface GDLerderBoradTableViewCell  ()
@property(nonatomic,strong)UIImageView *pictureView;
@end

@implementation GDLerderBoradTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self prepareUI];
    }
    return self;
}

-(void)prepareUI{
    
    _pictureView = [[UIImageView alloc]init];
    _pictureView.backgroundColor = blueColor;
    [_pictureView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _pictureView.contentMode = UIViewContentModeScaleAspectFill;
    _pictureView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _pictureView.clipsToBounds = YES;

    [self.contentView addSubview:_pictureView];
}

-(void)setModel:(GDLeaderBoardRequestData *)model{
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:model.coverImage]];
}

-(void)layoutSubviews{
    
    _pictureView.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);

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
