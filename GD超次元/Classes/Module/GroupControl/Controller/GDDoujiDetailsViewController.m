
//
//  GDDoujiDetailsViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/9/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDoujiDetailsViewController.h"
#import "GDHomeManager.h"
#import "GDDoujiDetailsDataModel.h"
#import "GDGDDoujiDetailsTableViewCell.h"

@interface GDDoujiDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray<GDDoujiDetailsRequestData *> *data;
@end

@implementation GDDoujiDetailsViewController
static NSString *Identifier = @"GDDoujiDetailsViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTableViewController];
    [self getDataIsMore:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore:(BOOL)isMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"os"] = @"iOS";
    parame[@"themeId"] = [NSString stringWithFormat:@"%ld",(long)_themeId];
    parame[@"v"] = @"2.1.0";
    
    [[GDHomeManager shareInstance]getFindDoujiDetailsRequestWithURL:DoujiDetailsURL parame:parame success:^(GDDoujiDetailsDataModel *dataModel) {
        
        [self.data addObjectsFromArray:dataModel.data];
        [self.tableView reloadData];
//        NSLog(@"%@",dataModel);
        
    } error:^(NSError *error) {
        
    }];
}

-(void)addTableViewController{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.contentInset = UIEdgeInsetsMake(7, 0, 0, 0);
    [_tableView registerClass:[GDGDDoujiDetailsTableViewCell class] forCellReuseIdentifier:Identifier];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return(self.data.count);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return[GDGDDoujiDetailsTableViewCell getHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GDGDDoujiDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    [cell setModel:self.data[indexPath.item]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = blueColor;
    return  cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D rotation;//3D旋转
    
    rotation = CATransform3DMakeTranslation(0 ,50 ,20);
    //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    
    rotation = CATransform3DScale(rotation, 0.9, .9, 1);
    
    rotation.m34 = 1.0/ -600;
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}


-(NSMutableArray<GDDoujiDetailsRequestData *> *)data{
    if (_data != nil) {
        return _data;
    }
    //实例化
    _data = [NSMutableArray array];
    
    return _data;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
