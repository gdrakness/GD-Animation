//
//  GDInformatTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/7/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDInformatTableViewCell.h"
#import "GDInformationRequstDataModel.h"

@interface GDInformatTableViewCell ()
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *descLable;
@end

@implementation GDInformatTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        self.contentView.backgroundColor = [UIColor grayColor];
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 115, 77)];
        _image.backgroundColor = blueColor;
        [self.contentView addSubview:_image];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 5, self.contentView.width - _image.width - 10, 38)];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.numberOfLines = 0;
        [_titleLable setTextColor:[UIColor darkGrayColor]];
//        [_titleLable setText:@"谁要这种反差萌啊喂！那些年我们追过的“两幅面孔”的二次元角色"];
        [self.contentView addSubview:_titleLable];
        
        _descLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 42, self.contentView.width - _image.width - 10, 38)];
        _descLable.textAlignment = NSTextAlignmentLeft;
        _descLable.font = [UIFont systemFontOfSize:10];
        _descLable.numberOfLines = 0;
        [_descLable setTextColor:[UIColor grayColor]];
//        [_descLable setText:@"俗话说看人不能看表面，在众多动漫作品中，也存在着拥有“两幅面孔”的角色。表面看上去温婉如玉，却在某些时刻就会展现出不为人知的凶狠一面；表面看上去是个万人迷美女，背地里却是个游戏阿宅；表面上看上去是个"];
        [self.contentView addSubview:_descLable];
    }
    
    return self;
}

-(void)setModel:(GDInformationDataModel *)model{
    
    [_image sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    
    _titleLable.text = model.title;
    
    _descLable.text = model.summary;
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
