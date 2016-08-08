//
//  GDVideoBluesTableViewCell.h
//  GD超次元
//
//  Created by gdarkness on 16/7/31.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDetailBluesDataModel.h"

@protocol selectorButtonTagDelegate <NSObject>

-(void)getVideoWebViewURL:(NSString *)url;

@end

@interface GDVideoBluesTableViewCell : UITableViewCell
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)NSMutableArray<GDVideosDetailsModel *> *videos;
@property (nonatomic, weak) id<selectorButtonTagDelegate> delegate;
@end
