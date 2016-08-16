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

@interface GDSearchViewController ()<UISearchBarDelegate>
@property(nonatomic,strong)NSMutableArray<GDSearchDataModel *> *data;
@property(nonatomic,strong)NSMutableArray *nameArray;
@property(nonatomic,strong) DBSphereView *sphereView;
@property(nonatomic,strong)UIButton *sphereBtn;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIImageView *btnImage;
@property (nonatomic, assign) double angle;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) NSUInteger updataNum;
@end

@implementation GDSearchViewController

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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
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
    
    GDSearchRequestData *nameData = [self.data objectAtIndex:send.tag + updataNum];
        NSLog(@"%@",nameData.name);
//    GDMoreTableViewController *moreVC = [[GDMoreTableViewController alloc]init];
//    moreVC.catId = nameData.fan_id;
//    [self.navigationController pushViewController:moreVC animated:YES];

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
    for (int i = 0; i < self.data.count; i++) {
        
        GDSearchRequestData *nameData = [self.data objectAtIndex:i];
        [_nameArray addObject:nameData.name];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchText];
    NSMutableArray *reusltArray = [NSMutableArray arrayWithArray:[self.nameArray filteredArrayUsingPredicate:predicate]];
    
    NSLog(@"%@",reusltArray);
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


-(void)startAnimation{
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.03 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _btnImage.transform = endAngle;
        
    } completion:^(BOOL finished) {
        _angle += 8;
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
