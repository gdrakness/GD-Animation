//
//  GDCompositorDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/6/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDCompositorPostsModel : NSObject
@property(nonatomic,copy)NSString *img;//图片
@property (nonatomic, assign)NSString *sort;//排序
@property (nonatomic, assign)NSString *score;//热度
@property(nonatomic,copy)NSString *video_info;//更新集数
@property(nonatomic,copy)NSString *title;//标题
@property (nonatomic, assign)NSString *time;
@property (nonatomic, copy)NSString *bbsid;
@property(nonatomic,copy)NSString *video;//集数
@property(nonatomic,copy)NSString *desc;//描述
@property(nonatomic,copy)NSString *url;//跳转路径
@end

@interface GDCompositorDataArrayModel : NSObject
@property(nonatomic,copy)NSString *type; //组种类
@property (nonatomic, assign)NSString *cat_id;
@property(nonatomic,strong)NSMutableArray<GDCompositorPostsModel *> *posts;
@end

@interface GDCompositorDataModel : NSObject
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong)NSMutableArray<GDCompositorDataArrayModel *> *data;
@end
