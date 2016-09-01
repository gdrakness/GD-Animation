//
//  GDCheckPictureCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/9/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCheckPictureCollectionViewCell.h"

@interface GDCheckPictureCollectionViewCell ()
@property(nonatomic,strong)UITapGestureRecognizer *tap_single_viewGesture;
@property(nonatomic,strong)UITapGestureRecognizer *tap_double_viewGesture;
@property(nonatomic,strong)UITapGestureRecognizer *tap_double_imageViewGesture;
@property(nonatomic,strong)UIRotationGestureRecognizer *rotaGesture;
@end

@implementation GDCheckPictureCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imageView];
        
        [self addTapGestureRecognizer];
    }
    return self;
}

-(void)addTapGestureRecognizer{
    
    [self addGestureRecognizer:self.tap_single_viewGesture];
    [self addGestureRecognizer:_tap_double_viewGesture];
    [self addGestureRecognizer:_tap_double_imageViewGesture];
}

//view单击
-(UITapGestureRecognizer *)tap_single_viewGesture{
    if (_tap_single_viewGesture == nil) {
        _tap_single_viewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_single_viewGesture:)];
        [_tap_single_viewGesture requireGestureRecognizerToFail:self.tap_double_viewGesture];
        [_tap_single_viewGesture requireGestureRecognizerToFail:self.tap_double_imageViewGesture];
    }
    return _tap_single_viewGesture;
}
//view双击
-(UITapGestureRecognizer *)tap_double_viewGesture{
    if (_tap_double_viewGesture == nil) {
        _tap_double_viewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_double_viewGesture:)];
        [_tap_double_viewGesture requireGestureRecognizerToFail:self.tap_double_imageViewGesture];
        _tap_double_viewGesture.numberOfTapsRequired = 2;
    }
    return _tap_double_viewGesture;
}

//image双击
-(UITapGestureRecognizer *)tap_double_imageViewGesture{
    if (_tap_double_imageViewGesture == nil) {
        _tap_double_imageViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_double_imageViewGesture:)];
        _tap_double_imageViewGesture.numberOfTapsRequired = 2;
    }
    return _tap_double_imageViewGesture;
}

-(void)tap_single_viewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"单击事件");
}

-(void)tap_double_viewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"双击事件");
}


-(void)tap_double_imageViewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"image双击事件");
}

@end
