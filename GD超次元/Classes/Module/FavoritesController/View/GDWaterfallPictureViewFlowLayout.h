//
//  GDWaterfallPictureViewFlowLayout.h
//  GD超次元
//
//  Created by gdarkness on 16/8/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDWaterfallPictureViewFlowLayoutDelegate <NSObject>

-(CGFloat)WaterfallPictureViewHeightForItemAtIndex:(NSIndexPath *)index;

@end

@interface GDWaterfallPictureViewFlowLayout : UICollectionViewFlowLayout

//列数
@property (nonatomic, assign) NSInteger cloumnNumber;

//间隔
@property (nonatomic, assign) CGFloat padding;

//集合视图整体边框
@property (nonatomic, assign) UIEdgeInsets degIndsets;

@property (nonatomic, weak) id<GDWaterfallPictureViewFlowLayoutDelegate> delegate;
@end
