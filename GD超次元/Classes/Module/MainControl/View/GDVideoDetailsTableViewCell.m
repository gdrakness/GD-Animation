


//
//  GDVideoDetailsTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDVideoDetailsTableViewCell.h"
#import "GDDetailsDataModel.h"
#import "GDHomeManager.h"
#import "UIView+Roundify.h"

@interface GDVideoDetailsTableViewCell ()
@property(nonatomic,strong)UIImageView *picture;
@property(nonatomic,strong)UILabel *titleName;
@property(nonatomic,strong)UILabel *statTimeLab;
@property(nonatomic,strong)UILabel *typeLab;
@property(nonatomic,strong)UILabel *descLab;
@end

@implementation GDVideoDetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 100)];
        _picture.backgroundColor = blueColor;
        [_picture addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(5, 5)];
        
        [self.contentView addSubview:_picture];
        
        _titleName = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 245, 20)];
        _titleName.textAlignment = NSTextAlignmentLeft;
        _titleName.font = [UIFont systemFontOfSize:16];
        [_titleName setTintColor:[UIColor blackColor]];
//        [_titleName setText:@"飙速宅男第二季"];
        [self.contentView addSubview:_titleName];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(90, 35, 40, 15)];
        [lable setFont:[UIFont systemFontOfSize:12]];
        [lable setTextColor:[UIColor blackColor]];
        [lable setText:@"热度:"];
        [self.contentView addSubview:lable];
        
        for (int i = 0; i < 5; i++) {
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(125, 35, 100, 15)];
            CGFloat starW = (view.bounds.size.width / 5);
            CGFloat starSpacing = (view.bounds.size.width - (5 * starW));
            CGFloat starX = (starSpacing + (starSpacing + starW - 5)) * (i % 5);
            UIImageView *starView = [UIImageView new];
            starView.image = [UIImage imageNamed:@"tjstar_full"];
            starView.frame = CGRectMake(starX, 2, 10, 10);
            [view addSubview:starView];
            
            [self.contentView addSubview:view];
        }
        
        UILabel *castLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 55, 245, 15)];
        [castLab setFont:[UIFont systemFontOfSize:12]];
        [castLab setTextColor:[UIColor blackColor]];
        [castLab setText:@"声优: admin"];
        [self.contentView addSubview:castLab];
        
        UILabel *statLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 75, 60, 15)];
        statLab.font = [UIFont systemFontOfSize:12];
        [statLab setTextColor:[UIColor blackColor]];
        statLab.textAlignment = NSTextAlignmentLeft;
        [statLab setText:@"开播时间:"];
        [self.contentView addSubview:statLab];
        
        _statTimeLab = [[UILabel alloc]initWithFrame:CGRectMake(144, 75, 245, 15)];
        _statTimeLab.textAlignment = NSTextAlignmentLeft;
        _statTimeLab.font = [UIFont systemFontOfSize:12];
        [_statTimeLab setTextColor:[UIColor grayColor]];
//        [_statTimeLab setText:[NSString stringWithFormat:@"开播时间:2014年10月6日"]];
        [self.contentView addSubview:_statTimeLab];
        
        UILabel *tyLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 95, 40, 15)];
        tyLab.font = [UIFont systemFontOfSize:12];
        [tyLab setTextColor:[UIColor blackColor]];
        tyLab.textAlignment = NSTextAlignmentLeft;
        [tyLab setText:@"类型: "];
        [self.contentView addSubview:tyLab];
        
        _typeLab = [[UILabel alloc]initWithFrame:CGRectMake(124, 95, 245, 15)];
        _typeLab.textAlignment = NSTextAlignmentLeft;
        _typeLab.font = [UIFont systemFontOfSize:12];
        [_typeLab setTextColor:[UIColor grayColor]];
//        [_typeLab setText:[NSString stringWithFormat:@"类型: 十月番、热血、竞技、励志"]];
        [self.contentView addSubview: _typeLab];
        
        _descLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, self.contentView.width - 15, 55)];
        _descLab.textAlignment = NSTextAlignmentJustified;
        _descLab.font = [UIFont systemFontOfSize:12];
        [_descLab setTextColor:[UIColor grayColor]];
//        [_descLab setText:@"  御宅族高中新生小野田坂道，遇上活跃于各大自行车比赛的今泉俊辅，两人间挥洒汗水的青春物语就此开始御宅族高中新生小野田坂道，遇上活跃于各大自行车比赛的今泉俊辅，两人间挥洒汗水的青春物语就此开始。"];
        _descLab.numberOfLines = 0;
        [self.contentView addSubview:_descLab];
    }
    return self;
}

-(void)setModel:(GDDetailsDataModel *)model{
    
    [_picture sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    
    [_titleName setText:model.name];
    
    [_statTimeLab setText:model.start_time];
    
    [_typeLab setText:model.type];
    
    [_descLab setText:model.desc];

}


@end
