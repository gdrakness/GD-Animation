

//
//  GDHomeManager.m
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDHomeManager.h"

#import "GDRequestMCDataModel.h"
#import "GDDetailsDataModel.h"
#import "GDClassRequstDataModel.h"

#import "LORequestManger.h"
@interface GDHomeManager ()

@property (nonatomic, copy) void (^success)(id);
@property (nonatomic, copy) void (^error)(NSError *);

@end

@implementation GDHomeManager

+(instancetype)shareInstance{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(void)getFindDealsWithParams:(NSMutableDictionary *)params success:(void(^)(GDRequestMCDataModel *dataModel))success error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
   
    [LORequestManger GET:MainURL success:^(id response) {
//        NSLog(@"%@",responseObjcet);
        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"posts":@"DataModel"
                };
        }];
        GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:response];
        
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];

}

-(void)getDetailsWithURL:(NSString *)url success:(void(^)(GDDetailsDataModel *detailsData))success error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url success:^(id response) {
        
            [GDDetailsDataModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"videos":@"GDVideosDetailsModel"
                        };
            }];
        GDDetailsDataModel *dataModel = [GDDetailsDataModel mj_objectWithKeyValues:response];
        
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
}

-(void)getFindClassRequstWithURL:(NSString *)url success:(void(^)(GDClassRequstDataModel *classDataModel))success error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:ClassURL success:^(id response) {
        
        [GDClassRequstDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"data":@"ClassDataModel"
                     };
        }];
        GDClassRequstDataModel *dataModel = [GDClassRequstDataModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
    
}
@end
