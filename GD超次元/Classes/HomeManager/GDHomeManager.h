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

@interface GDHomeManager : NSObject

+(instancetype)shareInstance;

//主页
-(void)getFindDealsWithParams:(NSMutableDictionary *)params success:(void(^)(GDRequestMCDataModel *dataModel))success error:(void(^)(NSError *error))error;
//主页详情
-(void)getDetailsWithURL:(NSString *)url success:(void(^)(GDDetailsDataModel *detailsData))success error:(void(^)(NSError *error))error;
//分类
-(void)getFindClassRequstWithURL:(NSString *)url success:(void(^)(GDClassRequstDataModel *classDataModel))success error:(void(^)(NSError *error))error;
@end
