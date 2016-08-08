//
//  GDFooterTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/8.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDFooterTableViewCell.h"

@implementation GDFooterTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        for (int i = 0; i < 3; i++) {
            
            CGFloat BtnW = (self.contentView.width / 3);
            CGFloat BtnSpacing = (self.contentView.width - (3 * BtnW));
            CGFloat BtnX = (BtnSpacing + (BtnSpacing + BtnW )) * (i % 3);
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(BtnX, 5, BtnW, 44);
            button.tag = i+1;
            switch (button.tag) {
                case 1:
                    [self getImageWithButton:button image:@"btn_rankVideo_norm@2x" selectorImage:@"btn_rankVideo_hl@2x"];
                    break;
                case 2:
                    [self getImageWithButton:button image:@"btn_play_norm@2x" selectorImage:@"btn_play_hl@2x"];
                    break;
                case 3:
                    [self getImageWithButton:button image:@"btn_collectVideo_norm@2x" selectorImage:@"btn_collectVideo_hl@2x"];
            }
            [self.contentView addSubview:button];

        }
        
    }
    return self;
}

-(void)getImageWithButton:(UIButton *)button image:(NSString *)image selectorImage:(NSString *)selectorImage{
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectorImage] forState:UIControlStateHighlighted];

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
