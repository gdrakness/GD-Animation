//
//  GDCheckPictureViewController.h
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDetailsPictureDataModel.h"

@interface GDCheckPictureViewController : UIViewController<UINavigationControllerDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSMutableArray *pictureArray;
@property(nonatomic,assign)NSInteger currentIndexPath;
@property (nonatomic, copy) void (^indexPathBlock)(NSInteger indexPath);
@end
