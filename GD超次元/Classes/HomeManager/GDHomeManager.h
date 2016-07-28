//
//  GDHomeManager.h
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GDRequestMCDataModel;
@class GDDetailsDataModel;
@class GDClassRequstDataModel;
@class GDTimeTableModel;
@class GDInformationRequstDataModel;
@class GDHTMLDataModel;

@interface GDHomeManager : NSObject

+(instancetype)shareInstance;

//新番速递
-(void)getFindDealsWithParams:(NSMutableDictionary *)params success:(void(^)(GDRequestMCDataModel *dataModel))success error:(void(^)(NSError *error))error;
//新番详情
-(void)getDetailsWithURL:(NSString *)url success:(void(^)(GDDetailsDataModel *detailsData))success error:(void(^)(NSError *error))error;
//分类推荐
-(void)getFindClassRequstWithURL:(NSString *)url success:(void(^)(GDClassRequstDataModel *classDataModel))success error:(void(^)(NSError *error))error;
//动画排行
//时间表
-(void)getFindTimeTableRequstWithURL:(NSString *)url success:(void(^)(GDTimeTableModel *dataModel))success error:(void(^)(NSError *error))error;
//资讯
-(void)getFindInformationRequestWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(GDInformationRequstDataModel *dataModel))success error:(void(^)(NSError *error))error;

-(void)parsingHTMLRequestWithURL:(NSString *)url success:(void(^)(GDHTMLDataModel *dataMoedel))success error:(void(^)(NSError *error))error;
@end
