

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
#import "UIImageView+WebCache.h"

@interface GDCompositorTableViewCell ()
@property(nonatomic,strong)UIImageView *topView;//顶部视图

@property(nonatomic,strong)UIImageView *firstCoverView;//第一黄色填充框
@property(nonatomic,strong)UIImageView *firstView;//第一视图图片
@property(nonatomic,strong)UIButton *firstViewBtn;//第一视图点击按钮
@property(nonatomic,strong)UILabel *title;//第一视图标题
@property(nonatomic,copy)NSString *vstr;//第一视图集数模型数据
@property(nonatomic,strong)UILabel *videoLable;//第一视图集数
@property(nonatomic,strong)UILabel *descLable;//第一视图详情
@property(nonatomic,copy)NSString *firstUrl;//第一视图跳转链接

@property(nonatomic,strong)UIImageView *secondCoverView;//第二视图分割框
@property(nonatomic,strong)UIImageView *secondView;//第二视图图片
@property(nonatomic,strong)UIButton *secondViewFBtn;//第二视图(左边)点击按钮
@property(nonatomic,strong)UIButton *secondViewSBtn;//第二视图(右边)点击按钮
@property(nonatomic,copy)NSString *secondUrl;//第二视图跳转链接(左)
@property(nonatomic,copy)NSString *secondURL;//第二视图跳转链接(右)

@property(nonatomic,strong)UIView *thirdlyCoverView;//第三视图图片框
@property(nonatomic,strong)UIImageView *thrirdlyChildView;//第三视图子视图
@property(nonatomic,strong)UIView *alphaView;//第三视图四个子视图
@property(nonatomic,strong)UIImageView *oneImageView;//第三视图图片一
@property(nonatomic,strong)UIImageView *twoImageView;//第三视图图片二
@property(nonatomic,strong)UIImageView *threeImageView;//第三视图张图片三
@property(nonatomic,strong)UIImageView *fourImageView;//第三视图图片四
@property(nonatomic,strong)UILabel *oneTitleLab;//第三视图标题一
@property(nonatomic,strong)UILabel *twoTitleLab;//第三视图二
@property(nonatomic,strong)UILabel *threeTitleLab;//第三视图三
@property(nonatomic,strong)UILabel *fourTitleLab;//第三视图四
@property(nonatomic,strong)UILabel *oneVideoLab;//第三视图集数一
@property(nonatomic,strong)UILabel *twoVideoLab;//第三视图集数二
@property(nonatomic,strong)UILabel *threeVideoLab;//第三视图集数三
@property(nonatomic,strong)UILabel *fourVideoLab;//第三视图集数四
@property(nonatomic,copy)NSString *thirdlyOneURL;//第三视图跳转链接一
@property(nonatomic,copy)NSString *thirdlyTwoURL;//第三视图跳转链接二
@property(nonatomic,copy)NSString *thirdlyThreeURL;//第三视图跳转链接三
@property(nonatomic,copy)NSString *thirdlyFourURL;//第三视图跳转链接四

@end

@implementation GDCompositorTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self prepareUI];

    return self;
}

-(void)prepareUI{
    
/***********************topView************************/
    _topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 20)];
    [_topView setImage:[UIImage imageNamed:@"videoranktitle@2x"]];
    [self.contentView addSubview:_topView];
    
    _moerBtn = [[UIButton alloc]initWithFrame:_topView.frame];
    _moerBtn.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_moerBtn];
    
    _groupTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, -15, 80, 50)];
    _groupTitle.font = [UIFont systemFontOfSize:11];
    _groupTitle.textAlignment = NSTextAlignmentLeft;
    _groupTitle.textColor = [UIColor whiteColor];
//    _groupTitle.text = @"后宫排行榜";
    [_topView addSubview:_groupTitle];
    
/***********************firstView************************/
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(9, 39, [UIScreen mainScreen].bounds.size.width - 137, 135)];
    [self.contentView addSubview:_firstView];
    
    _firstCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 35, [UIScreen mainScreen].bounds.size.width - 10, 140)];
    [_firstCoverView setImage:[UIImage imageNamed:@"cover1"]];
    [self.contentView addSubview:_firstCoverView];
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 120, 5, 100, 15)];
    _title.font = [UIFont systemFontOfSize:12];
    _title.textColor = [UIColor darkGrayColor];
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
    
    [self setThirdlyViewWihtImage];
}

-(void)setVieoLableTitle:(NSString *)vstr{
    
    if (_videoLable.text) {
        _videoLable.text = nil;
    }
    _videoLable = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 125, 24, 120, 15)];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"更新:%@",vstr]];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 7)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    
    _videoLable.attributedText = str;
    _videoLable.font = [UIFont systemFontOfSize:11];
    _videoLable.textAlignment = NSTextAlignmentCenter;
    [_firstCoverView addSubview:_videoLable];
    
    _firstViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(9, 39, [UIScreen mainScreen].bounds.size.width - 137, 135)];
    [_firstViewBtn addTarget:self action:@selector(firstViewButtonPushController:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_firstViewBtn];
}

-(void)setThirdlyViewWihtImage{
    /***********************thirdlyView************************/
    _thirdlyCoverView = [[UIView alloc]initWithFrame:CGRectMake(5, 310, [UIScreen mainScreen].bounds.size.width - 10, 300)];
    [self.contentView addSubview:_thirdlyCoverView];
    
    CGFloat ViewWidth = (_thirdlyCoverView.frame.size.width / 2) - 10;
    CGFloat ViewHeight = _thirdlyCoverView.frame.size.height / 2 - 10;
    CGFloat Viewspacing = (_thirdlyCoverView.frame.size.width - (2 * ViewWidth)) / (3);
    
    for (int i = 0; i < 4; i++) {
        _alphaView = [[UIView alloc]init];
        
        CGFloat ViewX = (Viewspacing + (Viewspacing + ViewWidth )) * (i % 2);
        CGFloat ViewY = (Viewspacing + (Viewspacing + ViewHeight + 10)) * (i / 2);
        
        _alphaView.frame = CGRectMake(ViewX + 3, ViewY, ViewWidth, ViewWidth + 10);
        _alphaView.backgroundColor = [UIColor whiteColor];
        _alphaView.layer.cornerRadius = 5;
        
        [_thirdlyCoverView addSubview:_alphaView];
    
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, _alphaView.width, _alphaView.height)];
        button.tag = i+1;
        [button addTarget:self action:@selector(thirdlyViewButtonPushController:) forControlEvents:UIControlEventTouchUpInside];
        
        [_alphaView addSubview:button];
    }
    
    _oneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(3, 0, _alphaView.width, _alphaView.height - 32)];
    [_oneImageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
    
    _twoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(161, 0, _alphaView.width, _alphaView.height - 32)];
    [_twoImageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
    
    _threeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(3, 164, _alphaView.width, _alphaView.height - 32)];
    [_threeImageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
    
    _fourImageView = [[UIImageView alloc]initWithFrame:CGRectMake(161, 164, _alphaView.width, _alphaView.height - 32)];
    [_fourImageView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(5, 5)];
    
    [_thirdlyCoverView addSubview:_oneImageView];
    [_thirdlyCoverView addSubview:_twoImageView];
    [_thirdlyCoverView addSubview:_threeImageView];
    [_thirdlyCoverView addSubview:_fourImageView];
    
    _oneTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(9, _alphaView.height - 27, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_oneTitleLab textColor:[UIColor darkGrayColor] textFontSize:12];
    
    _twoTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(166, _alphaView.height - 27, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_twoTitleLab textColor:[UIColor darkGrayColor] textFontSize:12];
    
    _threeTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(9, _alphaView.height - 27 + 164, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_threeTitleLab textColor:[UIColor darkGrayColor] textFontSize:12];
    
    _fourTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(166, _alphaView.height - 27 + 164, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_fourTitleLab textColor:[UIColor darkGrayColor] textFontSize:12];
    
    [_thirdlyCoverView addSubview:_oneTitleLab];
    [_thirdlyCoverView addSubview:_twoTitleLab];
    [_thirdlyCoverView addSubview:_threeTitleLab];
    [_thirdlyCoverView addSubview:_fourTitleLab];
    
    _oneVideoLab = [[UILabel alloc]initWithFrame:CGRectMake(9, _alphaView.height - 14, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_oneVideoLab textColor:[UIColor grayColor] textFontSize:10];
    
    _twoVideoLab = [[UILabel alloc]initWithFrame:CGRectMake(166, _alphaView.height - 14, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_twoVideoLab textColor:[UIColor grayColor] textFontSize:10];
    
    _threeVideoLab = [[UILabel alloc]initWithFrame:CGRectMake(9, _alphaView.height - 14 + 164, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_threeVideoLab textColor:[UIColor grayColor] textFontSize:10];
    
    _fourVideoLab = [[UILabel alloc]initWithFrame:CGRectMake(166, _alphaView.height - 14 + 164, _alphaView.width - 10, 10)];
    [GDCompositorTableViewCell getTitleTextLable:_fourVideoLab textColor:[UIColor grayColor] textFontSize:10];
    
    [_thirdlyCoverView addSubview:_oneVideoLab];
    [_thirdlyCoverView addSubview:_twoVideoLab];
    [_thirdlyCoverView addSubview:_threeVideoLab];
    [_thirdlyCoverView addSubview:_fourVideoLab];
}

-(void)setModel:(GDCompositorPostsModel *)model{
    
    NSLog(@"---%@",model.sort);
    
    if ([model.sort isEqualToString:@"1"]) {
        [_firstView sd_setImageWithURL:[NSURL URLWithString:model.img]];
        [_title setText:model.title];
        _vstr = model.video;
        
        [self setVieoLableTitle:_vstr];
        [_descLable setText:model.desc];
        _firstUrl = model.url;
    }
    if ([model.sort isEqualToString:@"2"]) {
        [_secondView sd_setImageWithURL:[NSURL URLWithString:model.img]];
        _secondUrl = model.url;
    }
    if ([model.sort isEqualToString:@"3"]) {
        _secondURL = model.url;
    }
    if (!model.sort) {
//        NSLog(@"%@---%@",model.bbsid,model.title);
        if ([model.bbsid isEqualToString:@"210451"] || [model.bbsid isEqualToString:@"179541"]) {
            [_oneImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
            [_oneTitleLab setText:model.title];
            [_oneVideoLab setText:model.video_info];
            _thirdlyOneURL = model.url;

        }else if ([model.bbsid isEqualToString:@"80962"] || [model.bbsid isEqualToString:@"146528"]){
            [_twoImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
            [_twoTitleLab setText:model.title];
            [_twoVideoLab setText:model.video_info];
            _thirdlyTwoURL = model.url;

        }else if ([model.bbsid isEqualToString:@"148944"] || [model.bbsid isEqualToString:@"80967"]){
            [_threeImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
            [_threeTitleLab setText:model.title];
            [_threeVideoLab setText:model.video_info];
            _thirdlyThreeURL = model.url;

        }else if ([model.bbsid isEqualToString:@"81179"] || [model.bbsid isEqualToString:@"148973"]){
            [_fourImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
            [_fourTitleLab setText:model.title];
            [_fourVideoLab setText:model.video_info];
            _thirdlyFourURL = model.url;
        }
    }
}

-(void)firstViewButtonPushController:(UIButton *)send{
    
    if ([_delegate respondsToSelector:@selector(getFirstViewButtonPushController:)]) {
        [_delegate getFirstViewButtonPushController:_firstUrl];
    }
}

-(void)secondViewButtonPushController:(UIButton *)send{
    switch (send.tag) {
        case 1:
            if ([_delegate respondsToSelector:@selector(getSecondViewFButtonPushController:)]) {
                [_delegate getSecondViewFButtonPushController:_secondUrl];
            }
            break;
        case 2:
            if ([_delegate respondsToSelector:@selector(getSecondViewSButtonPushController:)]) {
                [_delegate getSecondViewSButtonPushController:_secondURL];
            }
            break;
    }
}

-(void)thirdlyViewButtonPushController:(UIButton *)send{
    switch (send.tag) {
        case 1:
            if ([_delegate respondsToSelector:@selector(getThirdlyViewOneButtonPushController:)]) {
                [_delegate getThirdlyViewOneButtonPushController:_thirdlyOneURL];
            }
            break;
        case 2:
            if ([_delegate respondsToSelector:@selector(getThirdlyViewTwoButtonPushController:)]) {
                [_delegate getThirdlyViewTwoButtonPushController:_thirdlyTwoURL];
            }
            break;
        case 3:
            if ([_delegate respondsToSelector:@selector(getThirdlyViewThreeButtonPushController:)]) {
                [_delegate getThirdlyViewThreeButtonPushController:_thirdlyThreeURL];
            }
            break;
        case 4:
            if ([_delegate respondsToSelector:@selector(getThirdlyViewFourButtonPushController:)]) {
                [_delegate getThirdlyViewFourButtonPushController:_thirdlyFourURL];
            }
            break;
        
    }
}

- (UIImage *)scaleToSize:(UIImage *)img
                    size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage; 
}

-(UIImageView *)oneImageView{
    if (_oneImageView != nil) {
        [_oneImageView setImage:[UIImage imageNamed:@""]];
    }
    return _oneImageView;
}

+(void)getTitleTextLable:(UILabel *)textLable
               textColor:(UIColor *)textColor
            textFontSize:(NSUInteger)textSize{
//    [textLable setText:@"山田君与7位魔女"];
    textLable.textColor = textColor;
    textLable.textAlignment = NSTextAlignmentLeft;
    textLable.font = [UIFont systemFontOfSize:textSize];
    textLable = nil;
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
