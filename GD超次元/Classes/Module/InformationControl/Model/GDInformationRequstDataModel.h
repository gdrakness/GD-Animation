//
//  GDInformationRequstDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDInformationPostsModel : NSObject
@property(nonatomic,copy)NSString *img;//展示图片
@property (nonatomic, assign) NSInteger sort;//顺序
@property (nonatomic, assign) NSInteger score;//分数
@property(nonatomic,copy)NSString *video_info;//更新集数
@property(nonatomic,copy)NSString *title;//标题
@property (nonatomic, assign) NSInteger time;//时间
@property (nonatomic, assign) NSInteger bbsid;
@property(nonatomic,copy)NSString *video;//集数
@property(nonatomic,copy)NSString *desc;//简介内容
@property(nonatomic,copy)NSString *url;//跳转url
@end

@interface GDInformationDataModel : NSObject
@property(nonatomic,copy)NSString *type;//类型
@property (nonatomic, assign) NSInteger cat_id;
@property(nonatomic,strong)NSMutableArray<GDInformationPostsModel *> *posts;
@end

@interface GDInformationRequstDataModel : NSObject
@property(nonatomic,copy)NSString *status;//状态
@property(nonatomic,strong)NSMutableArray<GDInformationDataModel *> *data;
@end
