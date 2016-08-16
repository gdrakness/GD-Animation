//
//  DBPoint.h
//  sphereTagCloud
//
//  Created by Xinbao Dong on 14/8/31.
//  Copyright (c) 2014年 Xinbao Dong. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#ifndef sphereTagCloud_DBPoint_h
#define sphereTagCloud_DBPoint_h

struct DBPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};

typedef struct DBPoint DBPoint;


DBPoint DBPointMake(CGFloat x, CGFloat y, CGFloat z) {
    DBPoint point;
    point.x = x;
    point.y = y;
    point.z = z;
    return point;
}

#endif
