//
//  GDCustomTransition.h
//  GD超次元
//
//  Created by gdarkness on 16/8/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,TransitionType){
    push,
    pop
};

@interface GDCustomTransition : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTransitionType:(TransitionType)type;

@end
