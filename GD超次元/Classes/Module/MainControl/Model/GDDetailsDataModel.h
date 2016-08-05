//
//  GDDetailsDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/6/22.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDDetailsDataModel : NSObject
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong)NSString *thumb;//图片
@property(nonatomic,copy)NSString *cast;//声优列表
@property(nonatomic,copy)NSString *type;//animation类型
@property(nonatomic,copy)NSString *desc;//animation details
@property(nonatomic,copy)NSString *start_time;//发售日期
@property (nonatomic, assign) NSString *stars;//星星
@property(nonatomic,copy)NSString *share_url;//分享URL
@property (nonatomic, assign) NSString *stars_count;//星星数
@property(nonatomic,copy)NSString *sort;//TV类型
@property(nonatomic,copy)NSString *name;// animation name
@property(nonatomic,copy)NSString *videos;
@end
