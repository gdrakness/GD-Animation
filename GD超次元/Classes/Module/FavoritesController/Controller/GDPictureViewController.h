//
//  GDPictureViewController.h
//  GD超次元
//
//  Created by gdarkness on 16/8/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDPictureViewController : UIViewController
@property (nonatomic, copy) NSString *getID;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,assign)NSIndexPath *currentIndexPath;
@property(nonatomic,copy)NSString *titleName;
@end
