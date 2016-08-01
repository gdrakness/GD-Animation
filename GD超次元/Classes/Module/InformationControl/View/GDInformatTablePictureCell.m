//
//  GDInformatTabblePictureCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformatTablePictureCell.h"
#import "GDInformationRequstDataModel.h"

@interface GDInformatTablePictureCell ()
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *titleLable;
@end

@implementation GDInformatTablePictureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.backgroundColor = [UIColor greenColor];
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 100)];
        _image.backgroundColor = blueColor;
        [self.contentView addSubview:_image];
        
        UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, self.contentView.height * 1.6, self.contentView.width, 30)];
        alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self.contentView addSubview:alphaView];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 2, self.contentView.width, 30)];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:12];
        [_titleLable setTextColor:[UIColor whiteColor]];
//        [_titleLable setText:@"居动漫：一年5亿+人气，获艾瑞资本与汉理资本联合投资"];
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

@end
