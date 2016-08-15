//
//  GDTableViewTuesdayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewTuesdayCellDelegate <NSObject>

-(void)getTuesdayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewTuesdayCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) id<GDTableViewTuesdayCellDelegate> delegate;
@end
