//  代码地址: https://github.com/CoderMJLee/MJRefresh
//  代码地址: http://code4app.com/ios/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E4%B8%8B%E6%8B%89%E4%B8%8A%E6%8B%89%E5%88%B7%E6%96%B0/52326ce26803fabc46000000
#import <UIKit/UIKit.h>

const CGFloat MJRefreshLabelLeftInset = 25;
const CGFloat MJRefreshHeaderHeight = 54.0;
const CGFloat MJRefreshFooterHeight = 44.0;
const CGFloat MJRefreshFastAnimationDuration = 0.25;
const CGFloat MJRefreshSlowAnimationDuration = 0.4;

NSString *const MJRefreshKeyPathContentOffset = @"contentOffset";
NSString *const MJRefreshKeyPathContentInset = @"contentInset";
NSString *const MJRefreshKeyPathContentSize = @"contentSize";
NSString *const MJRefreshKeyPathPanState = @"state";

NSString *const MJRefreshHeaderLastUpdatedTimeKey = @"MJRefreshHeaderLastUpdatedTimeKey";

NSString *const MJRefreshHeaderIdleText = @"MJRefreshHeaderIdleText";
NSString *const MJRefreshHeaderPullingText = @"MJRefreshHeaderPullingText";
NSString *const MJRefreshHeaderRefreshingText = @"MJRefreshHeaderRefreshingText";

NSString *const MJRefreshAutoFooterIdleText = @"MJRefreshAutoFooterIdleText";
NSString *const MJRefreshAutoFooterRefreshingText = @"MJRefreshAutoFooterRefreshingText";
NSString *const MJRefreshAutoFooterNoMoreDataText = @"MJRefreshAutoFooterNoMoreDataText";

NSString *const MJRefreshBackFooterIdleText = @"刷新完毕";
NSString *const MJRefreshBackFooterPullingText = @"松开刷新";
NSString *const MJRefreshBackFooterRefreshingText = @"正奋力加载中...";
NSString *const MJRefreshBackFooterNoMoreDataText = @"MJRefreshBackFooterNoMoreDataText";

NSString *const MJRefreshHeaderLastTimeText = @"最后更新时间:";
NSString *const MJRefreshHeaderDateTodayText = @"今天";
NSString *const MJRefreshHeaderNoneLastDateText = @"MJRefreshHeaderNoneLastDateText";