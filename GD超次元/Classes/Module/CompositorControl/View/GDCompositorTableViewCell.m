

//
//  GDCompositorTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCompositorTableViewCell.h"
#import "GDCompositorDataModel.h"
#import "UIView+Roundify.h"

@interface GDCompositorTableViewCell ()
@property(nonatomic,strong)UIImageView *topView;
@property(nonatomic,strong)UILabel *groupTitle;
@property(nonatomic,strong)UIImageView *firstCoverView;
@property(nonatomic,strong)UIImageView *firstView;
@property(nonatomic,strong)UIButton *firstViewBtn;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,copy)NSString *vstr;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *secondUrl;
@property(nonatomic,strong)UILabel *videoLable;
@property(nonatomic,strong)UILabel *descLable;
@property(nonatomic,strong)UIImageView *secondCoverView;
@property(nonatomic,strong)UIImageView *secondView;
@property(nonatomic,strong)UIButton *secondViewFBtn;
@property(nonatomic,strong)UIButton *secondViewSBtn;
@property(nonatomic,strong)UIView *thirdlyCoverView;
@property(nonatomic,strong)UIImageView *thrirdlyChildView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *video_infoTitle;

@end

@implementation GDCompositorTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        
        [self prepareUI];
    
    return self;
}

-(void)prepareUI{
    
    _topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 20)];
    [_topView setImage:[UIImage imageNamed:@"videoranktitle@2x"]];
    [self.contentView addSubview:_topView];
    
    _groupTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, -15, 80, 50)];
    _groupTitle.font = [UIFont systemFontOfSize:11];
    _groupTitle.textAlignment = NSTextAlignmentLeft;
    _groupTitle.textColor = [UIColor whiteColor];
    _groupTitle.text = @"后宫排行榜";
    [_topView addSubview:_groupTitle];
    
/***********************firstView************************/
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(9, 39, [UIScreen mainScreen].bounds.size.width - 137, 135)];
    [self.contentView addSubview:_firstView];
    
    _firstCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35, [UIScreen mainScreen].bounds.size.width - 10, 140)];
    [_firstCoverView setImage:[UIImage imageNamed:@"cover1"]];
    [self.contentView addSubview:_firstCoverView];
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 120, 5, 100, 15)];
    _title.font = [UIFont systemFontOfSize:12];
    _title.textColor = [UIColor blackColor];
    _title.textAlignment = NSTextAlignmentCenter;
    [_firstCoverView addSubview:_title];
    
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
    
    _descLable = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 57, 110, 80)];
    _descLable.font = [UIFont systemFontOfSize:10];
    _descLable.textColor = [UIColor grayColor];
    _descLable.numberOfLines = 0;
    [_firstCoverView addSubview: _descLable];
    
    
/***********************secondView************************/
    _secondView = [[UIImageView alloc]initWithFrame:CGRectMake(6, 182, [UIScreen mainScreen].bounds.size.width - 12, 116)];
    [self.contentView addSubview:_secondView];
    
    _secondCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 180,[UIScreen mainScreen].bounds.size.width - 10 , 120)];
    [_secondCoverView setImage:[UIImage imageNamed:@"cover23"]];
    [self.contentView addSubview:_secondCoverView];
    
    _secondViewFBtn = [[UIButton alloc]initWithFrame:CGRectMake(6, 182, [UIScreen mainScreen].bounds.size.width - 200, 120)];
    [_secondViewFBtn setBackgroundColor:[UIColor clearColor]];
    [_secondViewFBtn addTarget:self action:@selector(secondViewButtonPushController:) forControlEvents:UIControlEventTouchUpInside];
    _secondViewFBtn.tag = 1;
    [self.contentView addSubview:_secondViewFBtn];
    
    _secondViewSBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 182, [UIScreen mainScreen].bounds.size.width - 200, 120)];
    [_secondViewSBtn setBackgroundColor:[UIColor clearColor]];
    [_secondViewSBtn addTarget:self action:@selector(secondViewButtonPushController:) forControlEvents:UIControlEventTouchUpInside];
    _secondViewSBtn.tag = 2;
    [self.contentView addSubview:_secondViewSBtn];
    
/***********************thirdlyView************************/
    _thirdlyCoverView = [[UIView alloc]initWithFrame:CGRectMake(5, 310, [UIScreen mainScreen].bounds.size.width - 10, 300)];
    [self.contentView addSubview:_thirdlyCoverView];
    
    CGFloat ViewWidth = (_thirdlyCoverView.frame.size.width / 2) - 13;
    CGFloat ViewHeight = _thirdlyCoverView.frame.size.height / 2 - 10;
    CGFloat Viewspacing = (_thirdlyCoverView.frame.size.width - (2 * ViewWidth)) / (3);
    
    for (int i = 0; i < 4; i++) {
        
        UIView *alphaView = [[UIView alloc]init];
        
        CGFloat ViewX = (Viewspacing + (Viewspacing + ViewWidth - 8)) * (i % 2);
        CGFloat ViewY = (Viewspacing + (Viewspacing + ViewHeight)) * (i / 2);
        
        alphaView.frame = CGRectMake(ViewX + 8 , ViewY, ViewWidth, ViewWidth + 5);
        alphaView.backgroundColor = [UIColor whiteColor];
        alphaView.layer.cornerRadius = 5;
        [_thirdlyCoverView addSubview:alphaView];

        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, alphaView.width, alphaView.height - 30)];
        [button setImage:[UIImage imageNamed:@"1425449776105451.jpg"] forState:UIControlStateNormal];
        button.imageView.layer.cornerRadius = 5;
        [button.imageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
        [alphaView addSubview:button];
        
//        [alphaView addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadii:CGSizeMake(10, 10)];
    
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, alphaView.height - 27, alphaView.width - 5, 10)];
        [_titleLable setText:@"山田君与七个魔女"];
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:10];
        
        [alphaView addSubview:_titleLable];
        
        _video_infoTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, alphaView.height - 14, alphaView.width - 5, 10)];
        [_video_infoTitle setText:@"更新:更新至第12集"];
        _video_infoTitle.textColor = [UIColor blackColor];
        _video_infoTitle.textAlignment = NSTextAlignmentLeft;
        _video_infoTitle.font = [UIFont systemFontOfSize:10];
        
        [alphaView addSubview:_video_infoTitle];
    }
}

-(void)setModel:(GDCompositorPostsModel *)model{
    
    if ([model.sort isEqualToString:@"1"]) {
        [_firstView sd_setImageWithURL:[NSURL URLWithString:model.img]];
        [_title setText:model.title];
        _vstr = model.video;
        [self setVieoLableTitle:_vstr];
        [_descLable setText:model.desc];
        _url = model.url;
        
    }
    if ([model.sort isEqualToString:@"2"]) {
        [_secondView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    }
    
//    NSLog(@"%@",model.sort);
}

-(void)setVieoLableTitle:(NSString *)vstr{
    
    _videoLable = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 24, 120, 15)];
    //    NSString *vstr = @"第12集";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"更新:%@",vstr]];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 7)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    //        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique"             size:11] range:NSMakeRange(0, 4)];
    _videoLable.attributedText = str;
    _videoLable.font = [UIFont systemFontOfSize:11];
    _videoLable.textAlignment = NSTextAlignmentCenter;
    [_firstCoverView addSubview:_videoLable];
    
    _firstViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(9, 39, [UIScreen mainScreen].bounds.size.width - 137, 135)];
    //    [_firstViewBtn setBackgroundColor:[UIColor clearColor]];
     [_firstViewBtn addTarget:self action:@selector(firstViewButtonPushController:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_firstViewBtn];
    

}

-(void)firstViewButtonPushController:(UIButton *)send{
    
    if ([_delegate respondsToSelector:@selector(getFirstViewButtonPushController:)]) {
        [_delegate getFirstViewButtonPushController:_url];
    }
}

-(void)secondViewButtonPushController:(UIButton *)send{
    switch (send.tag) {
        case 1:
            NSLog(@"one button");
            break;
        case 2:
            NSLog(@"two button");
            break;

    }
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
