

//
//  GDCompositorTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCompositorTableViewCell.h"
#import "UIView+Roundify.h"

@interface GDCompositorTableViewCell ()
@property(nonatomic,strong)UIImageView *topView;
@property(nonatomic,strong)UILabel *groupTitle;
@property(nonatomic,strong)UIImageView *firstCoverView;
@property(nonatomic,strong)UIImageView *secondCoverView;
@property(nonatomic,strong)UIView *thirdlyCoverView;
@property(nonatomic,strong)UIImageView *thrirdlyChildView;
@end

@implementation GDCompositorTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 20)];
        [_topView setImage:[UIImage imageNamed:@"videoranktitle@2x"]]; 
        [self.contentView addSubview:_topView];
        
        _groupTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, -15, 80, 50)];
        _groupTitle.font = [UIFont systemFontOfSize:11];
        _groupTitle.textAlignment = NSTextAlignmentLeft;
        _groupTitle.textColor = [UIColor whiteColor];
        _groupTitle.text = @"后宫排行榜";
        [_topView addSubview:_groupTitle];
        
        _firstCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35, [UIScreen mainScreen].bounds.size.width - 10, 150)];
        [_firstCoverView setImage:[UIImage imageNamed:@"cover1"]];
        [self.contentView addSubview:_firstCoverView];
        
        _secondCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 190,[UIScreen mainScreen].bounds.size.width - 10 , 120)];
        [_secondCoverView setImage:[UIImage imageNamed:@"cover23"]];
        [self.contentView addSubview:_secondCoverView];
        
        _thirdlyCoverView = [[UIView alloc]initWithFrame:CGRectMake(5, 320, [UIScreen mainScreen].bounds.size.width - 10, 300)];
        [_thirdlyCoverView setBackgroundColor:[UIColor grayColor]];
        [self.contentView addSubview:_thirdlyCoverView];
        
        CGFloat BtnWidth = (_thirdlyCoverView.frame.size.width / 2) - 7;
        CGFloat BtnHeight = _thirdlyCoverView.frame.size.height / 2 + 30;
        CGFloat Btnspacing = (_thirdlyCoverView.frame.size.width - (2 * BtnWidth)) / (3);
        
        for (int i = 0; i < 4; i++) {
            
            UIButton *button = [[UIButton alloc]init];
            
            CGFloat BtnX = (Btnspacing + (Btnspacing + BtnWidth + 5)) * (i % 2);
            CGFloat BtnY = (Btnspacing + (Btnspacing + BtnHeight + 5)) * (i / 2);
            
            button.frame = CGRectMake(BtnX, BtnY, BtnWidth, BtnHeight);
            [button setImage:[UIImage imageNamed:@"1425449776105451.jpg"] forState:UIControlStateNormal];
            [button setTitle:@"山田君与七个魔女" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:11];
            button.imageView.layer.cornerRadius = 10;
            
            [_thirdlyCoverView addSubview:button];
            
            UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, button.frame.size.height - 20, button.frame.size.width, 25)];
            
            alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
            [alphaView addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadii:CGSizeMake(10, 10)];
        
            [button addSubview:alphaView];
            
            
            
        }
        
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
