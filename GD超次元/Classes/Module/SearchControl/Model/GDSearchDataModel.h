//
//  GDSearchDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/17.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDSearchRequestData : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *fan_id;
@end

@interface GDSearchDataModel : NSObject
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong) NSMutableArray <GDSearchRequestData *> *data;
@end
