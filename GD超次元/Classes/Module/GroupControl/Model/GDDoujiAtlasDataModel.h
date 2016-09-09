//
//  GDDoujiAtlasDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDDoujiAtlasRequestData : NSObject
@property(nonatomic,copy)NSString *coverImage;
@property(nonatomic,copy)NSString *name;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger type;
@end

@interface GDDoujiAtlasDataModel : NSObject
@property (nonatomic, assign) NSInteger code;
@property(nonatomic,strong)NSMutableArray<GDDoujiAtlasRequestData *> *data;
@end
