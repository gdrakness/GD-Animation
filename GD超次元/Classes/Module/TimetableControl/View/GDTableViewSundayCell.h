//
//  GDTableViewSundayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewSundayCellDelegate <NSObject>

-(void)getSundayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewSundayCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) id<GDTableViewSundayCellDelegate> delegate;
@end
