//
//  GDDoujiDetailsDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDDoujiDetailsRequestData : NSObject
@property(nonatomic,strong)NSMutableArray<NSString *> *images;
@property(nonatomic,copy)NSString *panPw;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *pan;
@property(nonatomic,copy)NSString *cp;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger postTime;
@end

@interface GDDoujiDetailsDataModel : NSObject
@property (nonatomic, assign) NSInteger code;
@property(nonatomic,strong)NSMutableArray *data;
@end
