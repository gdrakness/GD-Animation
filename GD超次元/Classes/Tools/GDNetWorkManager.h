//
//  GDNetWorkManager.h
//  GD超次元
//
//  Created by gdarkness on 16/4/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface GDNetWorkManager : AFHTTPSessionManager
+(instancetype)shareManager;

-(void)requestGetWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInfo))error;

-(void)requestPostWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInfo))error;

-(void)requestWithGET:(NSString *)url paramaeters:(NSDictionary *)parameters success:(void(^)(id responseObjcet))successe error:(void(^)(NSError *errorInfo))error;
@end
