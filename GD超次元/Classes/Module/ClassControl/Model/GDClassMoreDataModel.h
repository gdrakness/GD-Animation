//
//  GDClassMoreDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/15.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDMoreDataModel : NSObject
@property(nonatomic,copy)NSString *img;
@property (nonatomic, assign) NSString *time;
@property(nonatomic,copy)NSString *video_info;
@property(nonatomic,copy)NSString *title;
@property (nonatomic, assign) NSString *bbsid;
@property(nonatomic,copy)NSString *video;
@property(nonatomic,copy)NSString *url;
@end

@interface GDClassMoreDataModel : NSObject
@property(nonatomic,strong)NSMutableArray<GDMoreDataModel *> *posts;
@end
