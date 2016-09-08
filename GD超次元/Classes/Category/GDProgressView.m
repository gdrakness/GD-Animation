//
//  GDProgressView.m
//  GD超次元
//
//  Created by gdarkness on 16/9/8.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDProgressView.h"
#import "LFRoundProgressView.h"
#import "UIColor+Extend.h"

@interface GDProgressView ()
@property (nonatomic,strong) LFRoundProgressView *progressView;

@end

@implementation GDProgressView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}



/*
 *  视图准备
 */
-(void)viewPrepare{
    
    self.backgroundColor = rgba(0, 0, 0, .5f);
    
    [self addSubview:self.progressView];
    
    self.clipsToBounds = YES;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.width * .5f;
    
    
    
    CGFloat d_xy = 5.0f;
    
    self.progressView.frame = CGRectInset(self.bounds, d_xy, d_xy);
}


-(void)setProgress:(float)progress{
    
    _progress = progress;
    
    self.progressView.progress = progress;
    
    if(progress >= 1){
        [UIView animateWithDuration:.5f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}


-(LFRoundProgressView *)progressView{
    
    if(_progressView == nil){
        
        _progressView =[[LFRoundProgressView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    
    return _progressView;
}
@end
