//
//  GDCotentDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/26.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDContentRequestDataModel : NSObject
@property(nonatomic,copy)NSString *share_url;
@property(nonatomic,copy)NSString *coverImage;
@property(nonatomic,copy)NSString *title;
@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, assign) NSUInteger time;
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *content;

@end

@interface GDContentDataModel : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,strong)GDContentRequestDataModel *data;
@end
