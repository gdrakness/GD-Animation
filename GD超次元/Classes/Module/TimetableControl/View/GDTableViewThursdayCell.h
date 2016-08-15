//
//  GDTableViewThursdayCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/24.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDTableViewThursdayCellDelegate <NSObject>

-(void)getThursdayTableViewPushDetailsViewControllerWithURL:(NSString *)url;

@end

@interface GDTableViewThursdayCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) id<GDTableViewThursdayCellDelegate> delegate;
@end
