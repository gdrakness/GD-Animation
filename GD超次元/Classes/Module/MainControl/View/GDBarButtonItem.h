//
//  GDBarButtonItem.h
//  GD超次元
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDBarButtonItem : UIBarButtonItem

+(instancetype)barButtonItemWithImageHighlighted:(NSString *)highlightedImg image:(NSString *)image target:(id)target action:(SEL)aciton;
@end
