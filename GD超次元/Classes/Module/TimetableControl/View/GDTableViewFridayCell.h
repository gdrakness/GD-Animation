//
//  GDTableViewFridayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewFridayCellDelegate <NSObject>

-(void)getFridayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewFridayCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) id<GDTableViewFridayCellDelegate> delegate;
@end
