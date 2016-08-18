//
//  GDLeaderBoardDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/19.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDLeaderBoardRequestData : NSObject
@property(nonatomic,copy)NSString *coverImage;
@property(nonatomic,copy)NSString *title;
@property (nonatomic, assign) NSUInteger like;
@property (nonatomic, assign) NSUInteger liked;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) NSUInteger id;
@end

@interface GDLeaderBoardDataModel : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *pages;
@property(nonatomic,strong)NSMutableArray<GDLeaderBoardRequestData *> *data;
@end
