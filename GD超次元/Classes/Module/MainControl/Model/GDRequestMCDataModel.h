//
//  GDRequestMCDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDRequestMCDataModel : NSObject
//集数
@property (nonatomic, copy) NSString *latest;
//图片
@property (nonatomic, copy) NSString *img;
//时间
@property (nonatomic, assign) NSInteger *time;
//更新集数
@property (nonatomic, copy) NSString *video_info;
//标题
@property (nonatomic, copy) NSString *title;
//bbsid
@property (nonatomic, assign) NSInteger *bbsid;
//类型
@property (nonatomic, copy) NSString *type;
//跳转url
@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) NSArray *model;


@end
