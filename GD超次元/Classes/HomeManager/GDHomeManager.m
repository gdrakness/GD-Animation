

//
//  GDHomeManager.m
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDHomeManager.h"
#import "GDNetWorkManager.h"
#import "GDRequestMCDataModel.h"

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
    
    [[GDNetWorkManager shareManager]requestWithGET:URL paramaeters:nil success:^(id responseObjcet) {
//        NSLog(@"%@",responseObjcet);
        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"DataModel"
                     };
        }];
        GDRequestMCDataModel *data = [GDRequestMCDataModel mj_objectWithKeyValues:responseObjcet];
        
        self.success(data);
        
    } error:^(NSError *errorInfo) {
        
        NSLog(@"%@",errorInfo);
    }];
    
}
@end
