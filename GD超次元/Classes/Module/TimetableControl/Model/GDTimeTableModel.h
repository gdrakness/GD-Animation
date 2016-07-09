//
//  GDTimeTableModel.h
//  GD超次元
//
//  Created by gdarkness on 16/7/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDTimeTableDescModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *image;
@property (nonatomic, assign) NSInteger bbs_id;
@end

@interface GDTimeTableModel : NSObject
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *mon;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *tue;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *wed;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *thu;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *fri;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *sat;
@property(nonatomic,strong)NSMutableArray <GDTimeTableDescModel *> *sun;
@end
