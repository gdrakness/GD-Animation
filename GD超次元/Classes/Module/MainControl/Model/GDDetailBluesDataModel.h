//
//  GDDetailBluesDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/2.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDVideosDetailsModel : NSObject
@property(nonatomic,copy)NSString *vsite;//播放媒体类型
@property (nonatomic, assign) NSInteger jishu;//集数
@property(nonatomic,copy)NSString *vtitle;//标题
@property(nonatomic,copy)NSString *type;//TV类型
@property(nonatomic,copy)NSString *vid;
@property(nonatomic,copy)NSString *sr;//播放媒体URL
@end

@interface GDDetailBluesDataModel : NSObject
@property(nonatomic,strong)NSMutableArray<GDVideosDetailsModel *> *videos;

@end
