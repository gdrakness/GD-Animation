//
//  GDCheckPictureCollectionViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/9/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCheckPictureCollectionViewCell.h"
#import "UIView+Roundify.h"
#import "UIImage+Extend.h"

@interface GDCheckPictureCollectionViewCell ()<UIScrollViewDelegate>{
    CGFloat _zoomScale;
}
@property(nonatomic,strong)UITapGestureRecognizer *tap_single_viewGesture;
@property(nonatomic,strong)UITapGestureRecognizer *tap_double_viewGesture;
@property(nonatomic,strong)UITapGestureRecognizer *tap_double_imageViewGesture;
@property(nonatomic,strong)UIRotationGestureRecognizer *rotaGesture;
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,assign) CGFloat zoomScale;
@property (nonatomic, assign) BOOL isDoubleClick;
@property(nonatomic)BOOL zoomOut_In;
@end

@implementation GDCheckPictureCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
//        [_imageView setMultipleTouchEnabled:YES];
        [_imageView setUserInteractionEnabled:YES];
        
        [self addGestureRecognizerToView:_imageView];
//        [self.contentView addSubview:_imageView];
        
        _scrollView = [[UIScrollView alloc]initWithFrame:self.contentView.bounds];
        _scrollView.delegate = self;
        [_scrollView setMinimumZoomScale:0.5];
         _scrollView.maximumZoomScale = 2.0;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self.scrollView addSubview:_imageView];
        [self.contentView addSubview:self.scrollView];

        [self addTapGestureRecognizer];
    }
    return self;
}

-(void)addTapGestureRecognizer{
    
    [self addGestureRecognizer:self.tap_single_viewGesture];
    [self addGestureRecognizer:self.tap_double_viewGesture];
    [self addGestureRecognizer:self.tap_double_imageViewGesture];
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


// 添加所有的手势
- (void) addGestureRecognizerToView:(UIView *)view
{
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
//    [view addGestureRecognizer:panGestureRecognizer];
}

// 处理旋转手势
- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    UIView *view = rotationGestureRecognizer.view;
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
        [rotationGestureRecognizer setRotation:0];
    }
}


// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
}

-(void)tap_single_viewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"单击事件");
    if (_itemViewFullBlock != nil) _itemViewFullBlock();
}

-(void)tap_double_viewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"双击事件");
}


-(void)tap_double_imageViewGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"image双击事件");
    float newscale=0.0;
    if (_zoomOut_In) {
        newscale = 2*1.5;
        _zoomOut_In = NO;
    }else
    {
        newscale = 1.1;
        _zoomOut_In = YES;
    }
    
    CGRect zoomRect = [self zoomRectForScale:newscale withCenter:[gesture locationInView:gesture.view]];
    NSLog(@"zoomRect:%@",NSStringFromCGRect(zoomRect));
    [_scrollView zoomToRect:zoomRect animated:YES];//重新定义其cgrect的x和y值
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    

}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    
    zoomRect.size.height = [_scrollView frame].size.height / scale;
    zoomRect.size.width  = [_scrollView frame].size.width  / scale;
    
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}



@end
