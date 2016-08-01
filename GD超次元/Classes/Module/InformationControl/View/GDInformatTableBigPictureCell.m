//
//  GDInformatTabbleBigPictureCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformatTableBigPictureCell.h"
#import "GDInformationRequstDataModel.h"

@interface GDInformatTableBigPictureCell ()
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *titleLable;
@end

@implementation GDInformatTableBigPictureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 160)];
        _image.backgroundColor = blueColor;
        [self.contentView addSubview:_image];
        
        UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0,(_image.height * 0.81), self.contentView.width, 30)];
        alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self.contentView addSubview:alphaView];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 2, self.contentView.width, 30)];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:12];
        [_titleLable setTextColor:[UIColor whiteColor]];
//        [_titleLable setText:@"为世界的美好发起激燃之战 《崩坏3rd》手游评测"];
        [alphaView addSubview:_titleLable];
    }
    
    return self;
}

-(void)setModel:(GDInformationDataModel *)model{
    
    [_image sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    
    _titleLable.text = model.title;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)getCellHeight{
    
    return 160;
}

@end
