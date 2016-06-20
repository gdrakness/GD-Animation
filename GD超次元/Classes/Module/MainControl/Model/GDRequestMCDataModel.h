//
//  GDRequestMCDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic, assign) NSString *bbsid;//bbsid
@property (nonatomic, copy) NSString *img;//图片
@property (nonatomic, copy) NSString *latest;//集数
@property (nonatomic, assign) NSString *time;//时间
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *type;//类型
@property (nonatomic, copy) NSString *url;//跳转url
@property (nonatomic, assign) NSString *video;//视频编号
@property (nonatomic, copy) NSString *video_info;//更新集数
@end

@interface GDRequestMCDataModel : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,assign) NSInteger count;//总数
@property (nonatomic,assign) NSInteger pages;//页数
@property (nonatomic, strong) NSArray <DataModel *> *posts;
@end
