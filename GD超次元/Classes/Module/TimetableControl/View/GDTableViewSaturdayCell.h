//
//  GDTableViewSaturdayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewSaturdayCellDelegate <NSObject>

-(void)getSaturdayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewSaturdayCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) id<GDTableViewSaturdayCellDelegate> delegate;
@end
