//
//  GDCheckPictureCollectionViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/9/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDCheckPictureCollectionViewCell : UICollectionViewCell{
        CGFloat lastScale;
        CGRect oldFrame;    //保存图片原来的大小
        CGRect largeFrame;  //确定图片放大最大的程度
}
@property(nonatomic,strong)UIImageView *imageView;
@property (nonatomic, copy) void (^itemViewFullBlock)();

-(void)save:(void(^)())ItemImageSaveCompleteBlock failBlock:(void(^)())failBlock;

@end
