//
//  GDMoreTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/15.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDMoreTableViewCell.h"
#import "GDClassMoreDataModel.h"
#import "UIView+Roundify.h"

@interface GDMoreTableViewCell ()
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *videoLable;
@end

@implementation GDMoreTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareUI];
    }
    return self;
}

-(void)prepareUI{
    
    _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 75, 100)];
    _pictureView.backgroundColor = blueColor;
    [_pictureView addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(6, 6)];
    [self.contentView addSubview:_pictureView];
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(95, 10, [UIScreen mainScreen].bounds.size.width - 100, 20)];
    _titleLable.textAlignment = NSTextAlignmentLeft;
    _titleLable.font = [UIFont systemFontOfSize:15];
    _titleLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLable];
    
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(95, 40, [UIScreen mainScreen].bounds.size.width - 100, 15)];
    textLable.textAlignment = NSTextAlignmentLeft;
    textLable.font = [UIFont systemFontOfSize:12];
    textLable.textColor = [UIColor grayColor];
    [textLable setText:@"10月番/恋爱/燃/魔法/战斗/最近完结"];
    [self.contentView addSubview:textLable];
    
    _videoLable = [[UILabel alloc]initWithFrame:CGRectMake(95, 65, [UIScreen mainScreen].bounds.size.width - 100, 15)];
    _videoLable.textAlignment = NSTextAlignmentLeft;
    _videoLable.font = [UIFont systemFontOfSize:12];
    _videoLable.textColor = [UIColor grayColor];
    [self.contentView addSubview:_videoLable];
    
    UIView *starView = [[UIView alloc]initWithFrame:CGRectMake(95, 90, [UIScreen mainScreen].bounds.size.width - 200, 15)];
    
    [self.contentView addSubview:starView];
    
    for (int i = 0; i < 5; i++) {
    
        CGFloat starW = (starView.width / 5);
        CGFloat starSpacing = (starView.width - (5 * starW));
        CGFloat starX = (starSpacing + (starSpacing + starW - 5)) * (i % 5);
        UIImageView *starImage = [UIImageView new];
        starImage.image = [UIImage imageNamed:@"tjstar_full"];
        starImage.frame = CGRectMake(starX, 2, 10, 10);
        UIImageView *lastImage = [UIImageView new];
        lastImage.image = [UIImage imageNamed:@"tjstar@2x"];
        lastImage.frame = CGRectMake(starX, 2, 10, 10);
        
        [starView addSubview:lastImage];
        int num = arc4random_uniform(4);
        if (i < 3 || num >= i) {
            [starView addSubview:starImage];
        }
        
    }
}

-(void)setModel:(GDMoreDataModel *)model{
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    [_titleLable setText:model.title];
    [_videoLable setText:model.video_info];
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
