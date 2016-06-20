//
//  GDNetWorkManager.m
//  GD超次元
//
//  Created by gdarkness on 16/4/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDNetWorkManager.h"


@implementation GDNetWorkManager
+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    static GDNetWorkManager *instace;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15;
        instace.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"plant/html", nil];
        instace = [[self alloc]initWithBaseURL:BaseUrl];
    });
    return instace;
}
//GET请求
-(void)requestGetWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInfo))error{
    [[GDNetWorkManager shareManager]GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorInfo) {
        if (error) {
            error(errorInfo);
        }
    }];
}

-(void)requestPostWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInfo))error{
    [[GDNetWorkManager shareManager]POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorInfo) {
        if (error) {
            error(errorInfo);
        }
    }];
}

-(void)requestWithGET:(NSString *)url paramaeters:(NSDictionary *)parameters success:(void(^)(id responseObjcet))successe error:(void(^)(NSError *errorInfo))error{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successe) {
            successe(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull erroerInfo) {
        if (error) {
            error(erroerInfo);
        }
    }];
}
@end
