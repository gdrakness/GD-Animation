//
//  GDMainViewTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDMainViewTableViewCell.h"
#import "GDRequestMCDataModel.h"

@implementation GDMainViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(5, -([UIScreen mainScreen].bounds.size.height/1.5 -200)/2, [UIScreen mainScreen].bounds.size.width-10, [UIScreen mainScreen].bounds.size.height/1.7)];
        _picture.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview: _picture];
        
        _coverView = [[UIView alloc]initWithFrame:CGRectMake(5, (_picture.frame.size.height * 0.4), _picture.frame.size.width, _picture.frame.size.height * 0.08)];
        _coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self.contentView addSubview: _coverView];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 0,_coverView.width / 0.5, _coverView.height)];
        _titleLable.font = [UIFont systemFontOfSize:10];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.textColor = [UIColor whiteColor];
        [_coverView addSubview: _titleLable];
        
        _bluesLable = [[UILabel alloc]initWithFrame:CGRectMake(_coverView.width * 0.75, 0,80, _coverView.height)];
        _bluesLable.font = [UIFont systemFontOfSize:10];
        _bluesLable.textAlignment = NSTextAlignmentLeft;
        _bluesLable.textColor = [UIColor whiteColor];
        [_coverView addSubview: _bluesLable];
        
    }
    
    return self;
}

-(void)setModel:(DataModel *)model{
    
    if (_model != model) {
        
        [_picture sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
        
        _titleLable.text = model.title;
        
        _bluesLable.text = [NSString stringWithFormat:@"更新至%@",model.latest];
    }
}

- (CGFloat)cellOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    CGPoint windowCenter = self.superview.center;
    
    CGFloat cellOffsetY = centerY - windowCenter.y;
    
    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height *2;
    CGFloat offset =  -offsetDig * ([UIScreen mainScreen].bounds.size.height/1.5 - 200)/2;
    
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
    //    self.titleLabel.transform = transY;
    //    self.littleLabel.transform = transY;
    
    self.picture.transform = transY;
    
    return offset;
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
