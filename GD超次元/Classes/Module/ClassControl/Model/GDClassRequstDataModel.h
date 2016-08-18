//
//  GDClassRequstDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/6/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassDataModel : NSObject
@property(nonatomic,copy)NSString *name;
@property (nonatomic, copy)NSString *cat_id;
@property(nonatomic,copy)NSString *image;
@end

@interface GDClassRequstDataModel : NSObject
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong)NSMutableArray<ClassDataModel *> *data;
@end
