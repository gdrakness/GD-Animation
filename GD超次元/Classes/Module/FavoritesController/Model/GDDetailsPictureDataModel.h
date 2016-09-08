//
//  GDDetailsPictureDataModel.h
//  GD超次元
//
//  Created by gdarkness on 16/8/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDDetailsPictureDataModel : NSObject
@property(nonatomic,copy)NSString *panPw;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *fileName;
@property(nonatomic,copy)NSString *coverImage;
@property(nonatomic,copy)NSString *pan;
@property(nonatomic,copy)NSString *cp;
@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, assign) NSUInteger code;
@property (nonatomic, assign) NSUInteger like;
@property (nonatomic, assign) NSUInteger liked;
@property(nonatomic,strong)NSMutableArray *images;

-(BOOL)readLocalImage;

-(void)saveImageToLocal;
@end
