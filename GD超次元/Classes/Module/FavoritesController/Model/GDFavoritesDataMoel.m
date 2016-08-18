//
//  GDFavoritesDataMoel.m
//  GD超次元
//
//  Created by gdarkness on 16/8/18.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDFavoritesDataMoel.h"

@implementation GDFaovritesRequestData


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
//        if ([key isEqualToString:@"id"]) {
//            self.lastid = value;
//        }
    
}

@end

@implementation GDFavoritesDataMoel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)faovritesWithDict:(NSDictionary *)dict{
    return [[GDFavoritesDataMoel alloc]initWithDict:dict];
}

//-(void)setValue:(id)value forKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"data"]) {
//        NSDictionary *dataDic = (NSDictionary *)value[0];
//        [super setValue:dataDic[@"coverImage"] forKey:@"coverImage"];
//        [super setValue:dataDic[@"type"] forKey:@"type"];
//        [super setValue:dataDic[@"url"] forKey:@"url"];
//        [super setValue:dataDic[@"aid"] forKey:@"aid"];
////        [super setValue:dataDic[@"id"] forKey:@"id"];
//    }
//    [super setValue:value forKeyPath:key];
//}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
//            if ([key isEqualToString:@"id"]) {
//                self.lastid = value;
//            }
    
}
@end
