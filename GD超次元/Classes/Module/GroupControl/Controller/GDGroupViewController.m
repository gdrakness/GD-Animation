//
//  GDGroupViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/4/27.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDGroupViewController.h"
#import "GDRequestMCDataModel.h"
#import "LORequestManger.h"
#import "GDHomeManager.h"
#import "GDDetailsDataModel.h"
#import "GDDoujiAtlasDataModel.h"
#import <QuartzCore/QuartzCore.h>
#import "GDDuojiAtlasCollectionViewCell.h"
#import "GDDoujiDetailsViewController.h"


@interface GDGroupViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray<GDDoujiAtlasRequestData *> *data;
@end

#define BDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
#define BDWeather_URL @"http://api.map.baidu.com/telematics/v3/weather"

#define textURL @"http://api.moeju.cn/picture/themePicture?ak=&channel=AppStore&dk=a0e3fd2d4d860ff7fe4711e5e1319d4e714c055b&os=iOS&themeId=14&v=2.1.0"


@implementation GDGroupViewController
static NSString *Identifier = @"GDGroupViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self getDataIsMore:NO];
}

-(void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore:(BOOL)isMore{
    
    [[GDHomeManager shareInstance]getFindDuojiAtlasRequestWithURL:nil parame:nil success:^(GDDoujiAtlasDataModel *dataModel) {
        
        [self.data addObjectsFromArray:dataModel.data];
        [self.collectionView reloadData];
//        NSLog(@"%@",dataModel);
        
    } error:^(NSError *error) {
        
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GDDuojiAtlasCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    [cell setModel:self.data[indexPath.item]];
    cell.layer.cornerRadius = 8;
    cell.backgroundColor = blueColor;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GDDoujiAtlasRequestData *itemModel = self.data[indexPath.item];
    GDDoujiDetailsViewController *DoujiDetailsVC = [[GDDoujiDetailsViewController alloc]init];
    DoujiDetailsVC.themeId = itemModel.id;
    
    [self.navigationController pushViewController:DoujiDetailsVC animated:YES];
    
    
}

-(UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((WIDTH - 30) / 2, (WIDTH - 30) / 2);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0 , 0, WIDTH , HEIGHT) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_collectionView registerClass:[GDDuojiAtlasCollectionViewCell class] forCellWithReuseIdentifier:Identifier];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}

-(NSMutableArray<GDDoujiAtlasRequestData *> *)data{
    if (_data != nil) {
        return _data;
    }
    //实例化
    _data = [NSMutableArray array];
    
    return _data;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [LORequestManger GET:textURL parame:nil success:^(id response) {
        
        NSLog(@"%@",response);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

//    NSDictionary *parameters = @{@"location":@"珠海",@"output":@"json",@"ak":BDWeather_KEY};
//    NSDictionary *parame = @{@"id":@"15725"};


//    [[GDNetWorkManager shareManager]requestWithGET:URL paramaeters:nil success:^(id responseObjcet) {
////        NSLog(@"%@",responseObjcet);
//        [GDRequestMCDataModel mj_setupObjectClassInArray:^NSDictionary *{
//            return @{
//                     @"posts":@"DataModel"
//                     };
//        }];
//            GDRequestMCDataModel *dataModel = [GDRequestMCDataModel mj_objectWithKeyValues:responseObjcet];
//        NSLog(@"%@",dataModel.posts);
//    
//     
//    } error:nil];
    
//    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
//    parame[@"savePath"] = @"D:\\test2\\";
//    parame[@"fileName"] = @"test.jpg";
//    
//    [[GDNetWorkManager shareManager]requestWithGET:@"http://192.168.1.9:9001/FileUpload/downloadFileServlet?fileDescribe=" paramaeters:parame success:^(id responseObjcet) {
//        
//        NSLog(@"%@",responseObjcet);
//        
//    } error:^(NSError *erroerInfo) {
//        
//        NSLog(@"%@",erroerInfo);
//    }];
//    
}




@end
