//
//  GDHomeManager.h
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GDRequestMCDataModel;

@interface GDHomeManager : NSObject

+(instancetype)shareInstance;


-(void)getFindDealsWithParams:(NSMutableDictionary *)params success:(void(^)(GDRequestMCDataModel *dataModel))success error:(void(^)(NSError *error))error;
@end
