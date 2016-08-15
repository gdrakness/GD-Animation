//
//  GDTableViewWednesdayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewWednesdayCellDelegate <NSObject>

-(void)getWednesdayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewWednesdayCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) id<GDTableViewWednesdayCellDelegate> delegate;
@end
