//
//  GDSearchViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/16.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDSearchViewController.h"
#import "DBSphereView.h"
#import <QuartzCore/QuartzCore.h>
#import "GDSearchDataModel.h"
#import "LORequestManger.h"
#import "GDMoreTableViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface GDSearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray<GDSearchDataModel *> *data;
@property(nonatomic,strong)NSMutableArray *nameArray;
@property(nonatomic,strong) DBSphereView *sphereView;
@property(nonatomic,strong)UIButton *sphereBtn;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIImageView *btnImage;
@property (nonatomic, assign) double angle;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) NSUInteger updataNum;
@property(nonatomic,strong)UIView *reusltView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *reusltArray;
@end

@implementation GDSearchViewController
static NSString *identifier = @"GDSearchViewController";
@synthesize sphereView;
@synthesize updataNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareSearchBar];
    [self prepareUploadButton];
    [self getDataIsMore:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor darkGrayColor]];
    
    updataNum = 0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBar removeFromSuperview];
    [sphereView timerStop];
    [_reusltView removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated{
    [sphereView timerStart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore:(BOOL)isMore{
    
    [LORequestManger GET:SearchURL parame:nil success:^(id response) {
        
        [GDSearchDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return@{
                    @"data":@"GDSearchRequestData"
                    };
        }];
        GDSearchDataModel *dataModel = [GDSearchDataModel mj_objectWithKeyValues:response];
        [self.data addObjectsFromArray:dataModel.data];
        
        [self showSphereView];
 
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)showSphereView{
    
    
    
    sphereView = [[DBSphereView alloc]initWithFrame:CGRectMake(10, 120, 300, 300)];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i = 0; i < 50; i++) {
        _sphereBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//        [_sphereBtn setTitle:[NSString stringWithFormat:@"Fuck%d",i] forState:UIControlStateNormal];
        GDSearchRequestData *nameData = [self.data objectAtIndex:i + updataNum];
        [_sphereBtn setTitle:nameData.name forState:UIControlStateNormal];
        [_sphereBtn setTitleColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] forState:UIControlStateNormal];
        _sphereBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sphereBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _sphereBtn.frame = CGRectMake(0, 0, 100, 25);
        _sphereBtn.tag = i;
        [_sphereBtn addTarget:self action:@selector(selectSphereButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:_sphereBtn];
        [sphereView addSubview:_sphereBtn];
    }
    [sphereView setCloudTags:array];
    sphereView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sphereView];
}

-(void)prepareUploadButton{
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(60, self.view.height - 60, self.view.width - 60 * 2, 40)];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitle:@"   更换一组推荐" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.layer.cornerRadius = 20;
    [button addTarget:self action:@selector(selectUploadButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _btnImage = [[UIImageView alloc]initWithFrame:CGRectMake(73, self.view.height - 52, 25, 25)];
    _btnImage.image = [UIImage imageNamed:@"Arrows_01"];
    [self.view addSubview:_btnImage];
}

-(void)selectUploadButtonMethod:(UIButton *)send{
   
    [self startAnimation];
    _flag = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        _flag = NO;
        _angle = 0.0;
        [self stopAnimation];
        
        updataNum += 10;
        [sphereView removeFromSuperview];
        [sphereView timerStop];
        [self showSphereView];
    });
    
    
    if (updataNum > self.data.count - 60) {
        updataNum = 0;
    }
    
}

-(void)selectSphereButtonMethod:(UIButton *)send{
    
    [sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        send.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            send.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [sphereView timerStart];
        }];
    }];
    
    GDSearchRequestData *nameData = [self.data objectAtIndex:send.tag + updataNum];
    
    NSLog(@"%@ --",nameData.fan_id);

}

-(void)prepareSearchBar{
    
     _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 0, self.view.width - 70 * 2, 44)];
    _searchBar.keyboardType = UIKeyboardTypeDefault;
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.barStyle = UIBarStyleDefault;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.placeholder = @"搜索番名";
    _searchBar.delegate = self;
    
    UIView *searchTextField = nil;
    searchTextField = [[[self.searchBar.subviews firstObject]subviews]lastObject];
//    for (UIView *subviews in self.searchBar.subviews) {
//        if ([subviews isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
//            searchTextField = subviews;
//        }
//    }
    searchTextField.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    searchTextField.layer.borderWidth = 1;
    searchTextField.layer.cornerRadius = 5;
    
    [self.navigationController.navigationBar addSubview:_searchBar];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {
        
    }
    
    for (GDSearchRequestData *nameData in self.data) {
        
        [_nameArray addObject:nameData.name];

    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchText];
    _reusltArray = [NSMutableArray arrayWithArray:[self.nameArray filteredArrayUsingPredicate:predicate]];
    
    if (_reusltArray.count != 0) {
        [self prepareReusltViewWithArray:_reusltArray];
    }else{
        [self dismissReusltView];
    }
//    NSLog(@"%@",_reusltArray);
}

-(void)prepareReusltViewWithArray:(NSMutableArray *)reusltArray{
    
    _reusltView = [[UIView alloc]initWithFrame:CGRectMake(70, 66, self.view.width - 60 * 2, 180)];
    _reusltView.backgroundColor = [UIColor whiteColor];
    CATransition *animationView = [CATransition animation];
    [animationView setDuration:0.3];
    [animationView setFillMode:kCAFillModeForwards];
    [animationView setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animationView setType:kCATransitionPush];
    [animationView setSubtype:kCATransitionFromBottom];
    animationView.delegate = self;
    [_reusltView.layer addAnimation:animationView forKey:@"animation"];
    [_reusltView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    
    [self.view addSubview:_reusltView];
    [self prepareTableView];
}

-(void)prepareTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width - 60 * 2, 180)];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [_reusltView addSubview:_tableView];
}

-(void)dismissReusltView{
    
    __weak typeof(self) weakSelf=self;
    [UIView transitionWithView:_reusltView duration:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        weakSelf.reusltView.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf.reusltView removeFromSuperview];
        [weakSelf.reusltView removeFromSuperview];

    }];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    searchBar.showsCancelButton = YES;
    searchBar.showsBookmarkButton = NO;
    for (UIView *view in [[[searchBar subviews]objectAtIndex:0]subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancel = (UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
    }
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    searchBar.showsCancelButton = NO;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _reusltArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.textLabel.text = _reusltArray[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (GDSearchRequestData *nameData in self.data) {
        if ([_reusltArray[indexPath.row] isEqualToString:nameData.name]) {
            NSLog(@"%@ -- %@",_reusltArray[indexPath.row],nameData.fan_id);
        }
    }
}


-(void)startAnimation{
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.02 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _btnImage.transform = endAngle;
        
    } completion:^(BOOL finished) {
        _angle += 5;
        if (_flag) {
            [self startAnimation];
        }
    }];
}

-(void)stopAnimation{
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.07 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _btnImage.transform = endAngle;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(NSMutableArray<GDSearchDataModel *> *)data{
    
    if (_data != nil) {
        return _data;
    }
    //实例化
    _data = [NSMutableArray array];
    
    return _data;
}

-(NSMutableArray *)nameArray{
    if (_nameArray != nil) {
        return _nameArray;
    }
    //实例化
    _nameArray = [NSMutableArray array];
    
    return _nameArray;
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
