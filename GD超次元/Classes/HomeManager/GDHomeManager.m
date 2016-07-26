

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
#import "GDTimeTableModel.h"
#import "GDInformationRequstDataModel.h"

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


/***********************新番速递************************/
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

/***********************新番详情************************/
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


/***********************分类推荐************************/
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


/***********************时间表************************/
-(void)getFindTimeTableRequstWithURL:(NSString *)url success:(void(^)(GDTimeTableModel *dataModel))success error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:TimeURL success:^(id response) {
        
        [GDTimeTableModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"mon":@"GDTimeTableDescModel",
                     @"tue":@"GDTimeTableDescModel",
                     @"wed":@"GDTimeTableDescModel",
                     @"thu":@"GDTimeTableDescModel",
                     @"fri":@"GDTimeTableDescModel",
                     @"sat":@"GDTimeTableDescModel",
                     @"sun":@"GDTimeTableDescModel",
                     };
        }];
        GDTimeTableModel *dataModel = [GDTimeTableModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        self.error(error);
    }];
}

/***********************资讯1************************/
-(void)getFindInformationRequestWithURL:(NSString *)url success:(void(^)(GDInformationRequstDataModel *dataModel))success error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url success:^(id response) {
        
        [GDInformationRequstDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"GDInformationDataModel"
                     };
        }];
        GDInformationRequstDataModel *dataModel = [GDInformationRequstDataModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
    
}

@end
