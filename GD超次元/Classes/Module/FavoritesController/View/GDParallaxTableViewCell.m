//
//  GDParallaxTableViewCell.m
//  GD超次元
//
//  Created by gdarkness on 16/8/19.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDParallaxTableViewCell.h"


static NSString *const kParallaxView = @"kParallaxView";
static NSString *const kParallaxOriginalCenterY = @"kParallaxOriginalCenterY";
static NSString *const kParallaxOffsetUp = @"kParallaxOffsetUp";
static NSString *const kParallaxOffsetDown = @"kParallaxOffsetDown";

@interface GDParallaxTableViewCell ()

//用于记录视差化视图的原始中心Y值
@property(nonatomic,strong)NSMutableArray *originalCenterYArray;
//记录视差化的视图
@property(nonatomic,strong)NSMutableArray *parallaxViewArray;
//为了应付重用，用于只记录alloc出来的，重用出来的需要重置状态
@property (nonatomic, assign) BOOL hasInited;

@end

@implementation GDParallaxTableViewCell

- (void)resetParallaxState
{
    self.parallaxViewArray = [NSMutableArray array];
}

- (void)parallaxWithView:(UIView *)view offsetUp:(CGFloat)offsetUp offsetDown:(CGFloat)offsetDown
{
    if (!self.hasInited) {
        if (!self.originalCenterYArray) {
            self.originalCenterYArray = [NSMutableArray array];
        }
        [self.originalCenterYArray addObject:@(view.center.y)];
    }
    
    NSDictionary *dict = @{kParallaxView : view,
                           kParallaxOriginalCenterY : self.originalCenterYArray[self.parallaxViewArray.count],
                           kParallaxOffsetUp : @(offsetUp),
                           kParallaxOffsetDown : @(offsetDown)};
    [self.parallaxViewArray addObject:dict];
}

- (void)updateViewFrameWithScrollView:(UIScrollView *)scrollView
{
    self.hasInited = YES;
    //（cell的origin.y 加上 一个cell的高度 减去 当前滚动的偏移Y值 ）除以 （屏幕的高度 加上 一个cell的高度）这个最好自己画图理解一下
    CGFloat percent = (self.frame.origin.y + self.frame.size.height - scrollView.contentOffset.y)/([UIScreen mainScreen].bounds.size.height+self.frame.size.height);
    [self updateViewFrameWithPercent:percent];
}

- (void)updateViewFrameWithPercent:(CGFloat)percent
{
    for (NSInteger index = 0; index < self.parallaxViewArray.count; index ++) {
        NSDictionary *dataDict = self.parallaxViewArray[index];
        UIView *view = dataDict[kParallaxView];
        CGFloat originalCenterY = [dataDict[kParallaxOriginalCenterY] floatValue];
        CGFloat offsetUp = [dataDict[kParallaxOffsetUp] floatValue];
        CGFloat offsetDown = [dataDict[kParallaxOffsetDown] floatValue];
        view.center = CGPointMake(view.center.x, [self interpolateFrom:originalCenterY - offsetUp to:originalCenterY + offsetDown percent:percent]);
    }
}

/**
 *  插值计算（线性），设置一个值的起始值与结束值，然后根据传入的百分比返回当前对应的值
 *
 *  @param from    起始值
 *  @param to      结束值
 *  @param percent 百分比
 *
 *  @return 当前值
 */
- (CGFloat)interpolateFrom:(CGFloat)from to:(CGFloat)to percent:(CGFloat)percent
{
    if (percent > 1) {
        return to;
    }
    if (percent < 0) {
        return from;
    }
    return (to - from)*percent + from;
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
