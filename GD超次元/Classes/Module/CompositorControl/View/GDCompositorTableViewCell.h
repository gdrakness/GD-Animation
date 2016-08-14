//
//  GDCompositorTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GDCompositorPostsModel;

@protocol GDCompositorDelegate <NSObject>

-(void)getFirstViewButtonPushController:(NSString *)url;

-(void)getSecondViewFButtonPushController:(NSString *)url;

-(void)getSecondViewSButtonPushController:(NSString *)url;

-(void)getThirdlyViewOneButtonPushController:(NSString *)url;

-(void)getThirdlyViewTwoButtonPushController:(NSString *)url;

-(void)getThirdlyViewThreeButtonPushController:(NSString *)url;

-(void)getThirdlyViewFourButtonPushController:(NSString *)url;

@end

@interface GDCompositorTableViewCell : UITableViewCell

-(void)setModel:(GDCompositorPostsModel *)model;
@property (nonatomic, weak) id<GDCompositorDelegate> delegate;

+(void)getTitleTextLable:(UILabel *)textLable
               textColor:(UIColor *)textColor
            textFontSize:(NSUInteger)textSize;
@end
