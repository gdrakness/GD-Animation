//
//  NSString_GDURL.h
//  GD超次元
//
//  Created by gdarkness on 16/6/25.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString ()
//主页
#define MainURL @"http://api.18touch.com/index.php?c=acg&a=lists&limit=500&v=2"
//搜索
#define SearchURL @"http://api.18touch.com/index.php?c=acg&a=getVedioNameList"
#define SearchUrl @"http://api.18touch.com/index.php?c=acg&a=searchVedio&"
//首页
#define CompositorURL @"http://api.18touch.com/index.php?c=acg&a=getVedioRankList"
//分类
#define ClassURL @"http://api.18touch.com/index.php?c=acg&a=getHotCategory"
#define ClassUrl @"http://api.18touch.com/index.php?c=acg&a=getListByCategory&"


//组
#define GroupURL @"http://api.bbs.18touch.com/Forum?zone=8700&dk=4ccb74169a048eaf055cda8f6c8f5eb5965aae10"
//资信1
#define INformationURL @"http://api.18touch.com/?c=Nzs&a=getlist&cat=%E5%8A%A8%E6%BC%AB%E8%B5%84%E8%AE%AF&img=1&summary=1&"
//资信2
#define InformationURL @"http://api.18touch.com/?c=Nzs&a=getlist&helper=ACG%E7%B2%BE%E5%93%81%E6%96%87%E7%AB%A0&img=1&lastid=0&lasttime=0"
//时间表
#define TimeURL @"http://api.18touch.com/?c=acg&a=timeline"

//轮播
#define PageFlowURL @"http://api.moeju.cn/startup/slider"

//轮播跳转url
#define requestURL @"http://www.moeju.cn/api/newsdetail?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b&"

//排行榜
#define LeaderBoradURL @"http://www.moeju.cn/api/leaderboard?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b&os=iOS&v=2.1.0"
//排行榜详情
#define DetailsPictureURL @"http://api.moeju.cn/picture/imageList?"

//排行榜图片图集
#define PictureURL @"http://api.moeju.cn/picture/special?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b"

//同人图集
#define DoujiURL @"http://api.moeju.cn/picture/theme?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b&os=iOS&v=2.1.0"

//同人图集详情
#define DoujiDetailsURL @"http://api.moeju.cn/picture/themePicture?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b"


@end
