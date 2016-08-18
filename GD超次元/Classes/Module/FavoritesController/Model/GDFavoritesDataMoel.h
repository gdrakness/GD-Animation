//
//  GDFavoritesDataMoel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/18.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDFaovritesRequestData : NSObject
@property(nonatomic,copy)NSString *coverImage;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *url;
@property (nonatomic, assign) NSUInteger aid;
@property (nonatomic, assign) NSUInteger id;
@end

@interface GDFavoritesDataMoel : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,strong)NSMutableArray<GDFaovritesRequestData *> *data;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)faovritesWithDict:(NSDictionary *)dict;
//-(void)setValue:(id)value forKey:(NSString *)key;
@end
