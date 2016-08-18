//
//  GDHomeManager.h
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDRequestMCDataModel.h"
#import "GDDetailsDataModel.h"
#import "GDClassRequstDataModel.h"
#import "GDCompositorDataModel.h"
#import "GDTimeTableModel.h"
#import "GDInformationRequstDataModel.h"
#import "GDDetailBluesDataModel.h"
#import "GDHTMLDataModel.h"
#import "GDSearchDataModel.h"
#import "GDFavoritesDataMoel.h"
#import "GDLeaderBoardDataModel.h"

@interface GDHomeManager : NSObject

+(instancetype)shareInstance;

//新番速递
-(void)getFindDealsWithParams:(NSMutableDictionary *)params
                      success:(void(^)(GDRequestMCDataModel *dataModel))success
                      error:(void(^)(NSError *error))error;
//新番详情
-(void)getDetailsWithURL:(NSString *)url
                    success:(void(^)(GDDetailsDataModel *detailsData))success
                    error:(void(^)(NSError *error))error;
//新番详细信息
-(void)getDetailsBluesWithURL:(NSString *)url
                      success:(void(^)(GDDetailBluesDataModel *detailsData))success
                        error:(void(^)(NSError *error))error;
//首页
-(void)getCompositorRequestWithURL:(NSString *)url
                           success:(void (^)(GDCompositorDataModel *compositorDataModel))success
                             error:(void(^)(NSError *error))error;
//分类推荐
-(void)getFindClassRequstWithURL:(NSString *)url
                            success:(void(^)(GDClassRequstDataModel *classDataModel))success
                            error:(void(^)(NSError *error))error;
//动画排行
//时间表
-(void)getFindTimeTableRequstWithURL:(NSString *)url
                                success:(void(^)(GDTimeTableModel *dataModel))success
                               error:(void(^)(NSError *error))error;
//资讯
-(void)getFindInformationRequestWithURL:(NSString *)url
                                params:(NSDictionary *)params
                                success:(void(^)(GDInformationRequstDataModel *dataModel))success
                                error:(void(^)(NSError *error))error;
//HTML
-(void)parsingHTMLRequestWithURL:(NSString *)url
                            success:(void(^)(GDHTMLDataModel *dataMoedel))success
                            error:(void(^)(NSError *error))error;
//轮播
-(void)getFindFaovritesRequestWithURl:(NSString *)url
                              success:(void(^)(GDFavoritesDataMoel *dataModel))success
                                error:(void(^)(NSError *error))error;


-(void)getFindLeadeBoardRequestWithURL:(NSString *)url
                               success:(void(^)(GDLeaderBoardDataModel *dataModel))success
                                 error:(void(^)(NSError *error))error;
@end
