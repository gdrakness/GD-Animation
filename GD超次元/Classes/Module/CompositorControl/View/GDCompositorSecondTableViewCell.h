//
//  GDCompositorSecondTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/8/14.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GDCompositorPostsModel;

@protocol GDCompositorSecondDelegate <NSObject>

-(void)getFirstViewButtonPushController:(NSString *)url;

-(void)getSecondViewFButtonPushController:(NSString *)url;

-(void)getSecondViewSButtonPushController:(NSString *)url;

-(void)getThirdlyViewOneButtonPushController:(NSString *)url;

-(void)getThirdlyViewTwoButtonPushController:(NSString *)url;

-(void)getThirdlyViewThreeButtonPushController:(NSString *)url;

-(void)getThirdlyViewFourButtonPushController:(NSString *)url;

@end

@interface GDCompositorSecondTableViewCell : UITableViewCell

-(void)setModel:(GDCompositorPostsModel *)model;
@property(nonatomic,strong)UILabel *groupTitle;//组名
@property(nonatomic,strong)UIButton *moerBtn;//更多按钮

@property (nonatomic, weak) id<GDCompositorSecondDelegate> delegate;
@end
