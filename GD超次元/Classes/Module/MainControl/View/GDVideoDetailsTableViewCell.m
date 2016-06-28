


//
//  GDVideoDetailsTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/6/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDVideoDetailsTableViewCell.h"


@implementation GDVideoDetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 80)];
        _picture.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_picture];
    }
    return self;
}

-(void)setModel:(GDDetailsDataModel *)model{
    
    [_picture sd_setImageWithURL:[NSURL URLWithString:model.thumb]placeholderImage:nil];
    
    
}
@end
