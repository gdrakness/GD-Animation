

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
@property(nonatomic,strong)UIImageView *firstView;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *videoLable;
@property(nonatomic,strong)UIImageView *secondCoverView;
@property(nonatomic,strong)UIImageView *secondView;
@property(nonatomic,strong)UIView *thirdlyCoverView;
@property(nonatomic,strong)UIImageView *thrirdlyChildView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *video_infoTitle;

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
        
        _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(9, 39, [UIScreen mainScreen].bounds.size.width - 137, 135)];
        [_firstView setImage:[UIImage imageNamed:@"1421035825228917"]];
        [self.contentView addSubview:_firstView];
        
        _firstCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35, [UIScreen mainScreen].bounds.size.width - 10, 140)];
        [_firstCoverView setImage:[UIImage imageNamed:@"cover1"]];
        [self.contentView addSubview:_firstCoverView];
        
        _title = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 120, 5, 100, 15)];
        [_title setText:@"绝对双刀"];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = [UIColor blackColor];
        _title.textAlignment = NSTextAlignmentCenter;
        [_firstCoverView addSubview:_title];
        
        _videoLable = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 24, 120, 15)];
        NSString *vstr = @"第12集";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"更新:%@",vstr]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 7)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
//        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique"             size:11] range:NSMakeRange(0, 4)];
        _videoLable.attributedText = str;
        _videoLable.font = [UIFont systemFontOfSize:11];
        _videoLable.textAlignment = NSTextAlignmentCenter;
        [_firstCoverView addSubview:_videoLable];
        
        UILabel *starLab = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 42, 30, 15)];
        starLab.text = @"评分:";
        starLab.textColor = [UIColor grayColor];
        starLab.font = [UIFont systemFontOfSize:11];
        [_firstCoverView addSubview:starLab];
        
        for (int i = 0; i < 5; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 95, 42, 100, 15)];
            CGFloat starW = (view.bounds.size.width / 5);
            CGFloat starSpacing = (view.bounds.size.width - (5 * starW));
            CGFloat starX = (starSpacing + (starSpacing + starW - 5)) * (i % 5);
            UIImageView *starView = [UIImageView new];
            starView.image = [UIImage imageNamed:@"tjstar_full"];
            starView.frame = CGRectMake(starX, 2, 10, 10);
            [view addSubview:starView];
            
            [_firstCoverView addSubview:view];
        }
        
        _secondView = [[UIImageView alloc]initWithFrame:CGRectMake(6, 182, [UIScreen mainScreen].bounds.size.width - 12, 116)];
        [_secondView setImage:[UIImage imageNamed:@"1421044163414588.jpg"]];
        [self.contentView addSubview:_secondView];
        
        _secondCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 180,[UIScreen mainScreen].bounds.size.width - 10 , 120)];
        [_secondCoverView setImage:[UIImage imageNamed:@"cover23"]];
        [self.contentView addSubview:_secondCoverView];
        
        _thirdlyCoverView = [[UIView alloc]initWithFrame:CGRectMake(5, 310, [UIScreen mainScreen].bounds.size.width - 10, 300)];
//        [_thirdlyCoverView setBackgroundColor:[UIColor grayColor]];
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
            button.imageView.layer.cornerRadius = 10;
            [_thirdlyCoverView addSubview:button];
            
            UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, button.frame.size.height - 25, button.frame.size.width, 25)];
            
            alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
            [alphaView addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadii:CGSizeMake(10, 10)];
        
            [button addSubview:alphaView];
            
            _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(8, 2, alphaView.bounds.size.width, 10)];
            [_titleLable setText:@"山田君与七个魔女"];
            _titleLable.textColor = [UIColor whiteColor];
            _titleLable.textAlignment = NSTextAlignmentLeft;
            _titleLable.font = [UIFont systemFontOfSize:9];
            
            [alphaView addSubview:_titleLable];
            
            _video_infoTitle = [[UILabel alloc]initWithFrame:CGRectMake(8, 13, alphaView.bounds.size.width, 10)];
            [_video_infoTitle setText:@"更新:更新至第12集"];
            _video_infoTitle.textColor = [UIColor whiteColor];
            _video_infoTitle.textAlignment = NSTextAlignmentLeft;
            _video_infoTitle.font = [UIFont systemFontOfSize:9];
            
            [alphaView addSubview:_video_infoTitle];
            
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
