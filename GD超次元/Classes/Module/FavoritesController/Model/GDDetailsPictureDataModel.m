//
//  GDDetailsPictureDataModel.m
//  GD超次元
//
//  Created by gdarkness on 16/8/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDetailsPictureDataModel.h"
#import "CoreArchive.h"

@implementation GDDetailsPictureDataModel

-(BOOL)readLocalImage{
    
    return [CoreArchive boolForKey:[NSString stringWithFormat:@"%@",self.fileName]];
}

-(void)saveImageToLocal{
    
    [CoreArchive setBool:YES key:[NSString stringWithFormat:@"%@",self.fileName]];

}
@end
