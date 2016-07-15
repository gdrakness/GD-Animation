//
//  GDTableViewMondelCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/10.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDTableViewMondelCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

+(CGFloat)getCellOfHeight;
@end
