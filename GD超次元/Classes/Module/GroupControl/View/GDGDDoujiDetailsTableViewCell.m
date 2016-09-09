//
//  GDGDDoujiDetailsTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDGDDoujiDetailsTableViewCell.h"

@interface GDGDDoujiDetailsTableViewCell ()
@property(nonatomic,strong)UIView *alphaView;
@end

@implementation GDGDDoujiDetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareUI];
    }
    return self;
}

-(void)prepareUI{
    
    _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, self.contentView.width, [[self class]getHeight] - 10)];
    _pictureView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_pictureView];
    
    _alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, [[self class]getHeight] - 25, self.contentView.width, 30)];
    [self.contentView addSubview:_alphaView];
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor darkGrayColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_alphaView.frame), CGRectGetHeight(_alphaView.frame));
    [_alphaView.layer addSublayer:gradientLayer];
    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 30)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.font = [UIFont systemFontOfSize:12];
    _titleLab.textColor = [UIColor whiteColor];
    [_alphaView addSubview:_titleLab];
}

-(void)setModel:(GDDoujiDetailsRequestData *)model{
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:model.images.firstObject]];
    
    [_titleLab setText:model.title];
}

+(CGFloat)getHeight{
    
    return 150;
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
