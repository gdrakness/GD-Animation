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
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *mon;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *tue;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *wed;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *thu;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *fri;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *sat;
@property(nonatomic,strong)NSArray <GDTimeTableDescModel *> *sun;
@end
