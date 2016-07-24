//
//  GDTimetableController.m
//  GD超次元
//
//  Created by gdarkness on 16/7/9.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTimetableController.h"
#import "GDTableViewMondelCell.h"
#import "GDHomeManager.h"
#import "GDTimeTableModel.h"

@class GDTimeTableDescModel;
@interface GDTimetableController ()
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *mon;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *tue;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *wed;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *thu;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *fri;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *sat;
@property(nonatomic,strong)NSMutableArray<GDTimeTableDescModel *> *sun;
@end

@implementation GDTimetableController
static NSString *Identifier = @"timeTableController";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GDTableViewMondelCell class] forCellReuseIdentifier:Identifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore{
    
    [[GDHomeManager shareInstance]getFindTimeTableRequstWithURL:nil success:^(GDTimeTableModel *dataModel) {
        
        [self.mon addObjectsFromArray:dataModel.mon];
        [self.tue addObjectsFromArray:dataModel.tue];
        [self.wed addObjectsFromArray:dataModel.wed];
        [self.thu addObjectsFromArray:dataModel.thu];
        [self.fri addObjectsFromArray:dataModel.fri];
        [self.sat addObjectsFromArray:dataModel.sat];
        [self.sun addObjectsFromArray:dataModel.sun];
        
//        NSLog(@"%@",self.tue);
        [self.tableView reloadData];
    } error:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GDTableViewMondelCell getCellOfHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GDTableViewMondelCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
//    cell.imageView.image = [UIImage imageNamed:@"mon2"];
    [cell sizeToFit];
    return cell;
    
}

-(NSMutableArray<GDTimeTableDescModel *> *)mon{
    
    if (_mon != nil) {
        return _mon;
    }
    //实例化
    _mon = [NSMutableArray array];
//    [self getDataIsMore];
    return _mon;
}

-(NSMutableArray<GDTimeTableDescModel *> *)tue{
    
    if (_tue != nil) {
        return _tue;
    }
    //实例化
    _tue = [NSMutableArray array];
    
    return _tue;
}

-(NSMutableArray<GDTimeTableDescModel *> *)wed{
    
    if (_wed != nil) {
        return _wed;
    }
    //实例化
    _wed = [NSMutableArray array];
    
    return _wed;
}

-(NSMutableArray<GDTimeTableDescModel *> *)thu{
    
    if (_thu != nil) {
        return _thu;
    }
    //实例化
    _thu = [NSMutableArray array];
    
    return _thu;
}
-(NSMutableArray<GDTimeTableDescModel *> *)fri{
    
    if (_fri != nil) {
        return _fri;
    }
    //实例化
    _fri = [NSMutableArray array];
    
    return _fri;
}

-(NSMutableArray<GDTimeTableDescModel *> *)sat{
    
    if (_sat != nil) {
        return _sat;
    }
    //实例化
    _sat = [NSMutableArray array];
    
    return _sat;
}

-(NSMutableArray<GDTimeTableDescModel *> *)sun{
    
    if (_sun != nil) {
        return _sun;
    }
    //实例化
    _sun = [NSMutableArray array];
    
    return _sun;
}



@end
