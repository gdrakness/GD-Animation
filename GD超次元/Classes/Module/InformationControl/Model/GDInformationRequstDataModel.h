//
//  GDInformationRequstDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/6/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDInformationDataModel : NSObject
@property (nonatomic, copy)NSString* id;//id编号
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *author;//作者
@property(nonatomic,copy)NSString *url;//跳转的url
@property (nonatomic, copy)NSString* posttime;//用于刷新帖子时间
@property(nonatomic,copy)NSString *img;//图片
@property(nonatomic,copy)NSString *summary;//详情
@end

@interface GDInformationRequstDataModel : NSObject
@property(nonatomic,copy)NSString *status;//状态
@property (nonatomic, assign) NSInteger pages;//数据包
@property (nonatomic, assign) NSInteger count;//总数量
@property(nonatomic,strong)NSMutableArray<GDInformationDataModel *> *posts;
@end
