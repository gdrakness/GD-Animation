

//
//  GDHomeManager.m
//  GD超次元
//
//  Created by gdarkness on 16/6/20.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDHomeManager.h"



#import "LORequestManger.h"
@interface GDHomeManager ()

@property (nonatomic, copy) void (^success)(id);
@property (nonatomic, copy) void (^error)(NSError *);

@end

@implementation GDHomeManager

+(instancetype)shareInstance{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}


/***********************新番速递************************/
-(void)getFindDealsWithParams:(NSMutableDictionary *)params
                        success:(void(^)(GDRequestMCDataModel *dataModel))success
                        error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:MainURL parame:nil success:^(id response) {
        
        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"DataModel"
                     };
        }];
        GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:response];
        
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.error(error);
    }];

}

/***********************新番详情************************/
-(void)getDetailsWithURL:(NSString *)url
                    success:(void(^)(GDDetailsDataModel *detailsData))success
                    error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url parame:nil success:^(id response) {

        GDDetailsDataModel *dataModel = [GDDetailsDataModel mj_objectWithKeyValues:response];
        
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);

    }];
}
/***********************新番详细信息************************/
-(void)getDetailsBluesWithURL:(NSString *)url
                        success:(void(^)(GDDetailBluesDataModel *detailsData))success
                        error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url parame:nil success:^(id response) {
        
        [GDDetailBluesDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"videos":@"GDVideosDetailsModel"
                     };
        }];
        GDDetailBluesDataModel *dataModel = [GDDetailBluesDataModel mj_objectWithKeyValues:response];
        
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
        
    }];
}
/***********************首页************************/
-(void)getCompositorRequestWithURL:(NSString *)url
                           success:(void (^)(GDCompositorDataModel *compositorDataModel))success
                             error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    [LORequestManger GET:CompositorURL parame:nil success:^(id response) {
        
        [GDCompositorDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"data":@"GDCompositorDataArrayModel"
                     };
        }];
        [GDCompositorDataArrayModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"GDCompositorPostsModel"
                     };
        }];
        GDCompositorDataModel *dataModel = [GDCompositorDataModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.error(error);
    }];
    
}


/***********************分类推荐************************/
-(void)getFindClassRequstWithURL:(NSString *)url
                            success:(void(^)(GDClassRequstDataModel *classDataModel))success
                           error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:ClassURL parame:nil success:^(id response) {
        
        [GDClassRequstDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"data":@"ClassDataModel"
                     };
        }];
        GDClassRequstDataModel *dataModel = [GDClassRequstDataModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
    
}


/***********************时间表************************/
-(void)getFindTimeTableRequstWithURL:(NSString *)url
                                success:(void(^)(GDTimeTableModel *dataModel))success
                                error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:TimeURL parame:nil success:^(id response) {
        
        [GDTimeTableModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"mon":@"GDTimeTableDescModel",
                     @"tue":@"GDTimeTableDescModel",
                     @"wed":@"GDTimeTableDescModel",
                     @"thu":@"GDTimeTableDescModel",
                     @"fri":@"GDTimeTableDescModel",
                     @"sat":@"GDTimeTableDescModel",
                     @"sun":@"GDTimeTableDescModel",
                     };
        }];
        GDTimeTableModel *dataModel = [GDTimeTableModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
}

/***********************资讯1************************/
-(void)getFindInformationRequestWithURL:(NSString *)url params:(NSDictionary *)params
                                    success:(void(^)(GDInformationRequstDataModel *dataModel))success
                                    error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url parame:params success:^(id response) {
        
        [GDInformationRequstDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"posts":@"GDInformationDataModel"
                     };
        }];
        GDInformationRequstDataModel *dataModel = [GDInformationRequstDataModel mj_objectWithKeyValues:response];
//        NSLog(@"%@",dataModel);
            self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
    
}
/***********************HTML************************/
-(void)parsingHTMLRequestWithURL:(NSString *)url
                            success:(void(^)(GDHTMLDataModel *dataMoedel))success
                            error:(void(^)(NSError *error))error{
    self.success = success;
    self.error = error;
    
    [LORequestManger GET:url parame:nil success:^(id response) {
        
        GDHTMLDataModel *dataModel = [GDHTMLDataModel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
}

/***********************轮播************************/
-(void)getFindFaovritesRequestWithURl:(NSString *)url
                              success:(void(^)(GDFavoritesDataMoel *dataModel))success
                                error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    [LORequestManger GET:PageFlowURL parame:nil success:^(id response) {
        
       [GDFavoritesDataMoel mj_setupObjectClassInArray:^NSDictionary *{
           return@{
                   @"data":@"GDFaovritesRequestData"
                   };
       }];
        
        GDFavoritesDataMoel *dataModel = [GDFavoritesDataMoel mj_objectWithKeyValues:response];
        self.success(dataModel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
}

/***********************排行榜************************/
-(void)getFindLeadeBoardRequestWithURL:(NSString *)url
                                parame:(NSDictionary *)parame
                               success:(void(^)(GDLeaderBoardDataModel *dataModel))success
                                 error:(void(^)(NSError *error))error{
    
    self.success = success;
    self.error = error;
    [LORequestManger GET:PictureURL parame:parame success:^(id response) {
        
        [GDLeaderBoardDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return@{
                    @"data":@"GDLeaderBoardRequestData"
                    };
        }];
        GDLeaderBoardDataModel *dataMoel = [GDLeaderBoardDataModel mj_objectWithKeyValues:response];
        self.success(dataMoel);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.error(error);
    }];
}
    
@end
