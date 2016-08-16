//
//  GDSearchViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/16.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDSearchViewController.h"
#import "DBSphereView.h"


@interface GDSearchViewController ()<UISearchBarDelegate>
@property(nonatomic,strong) DBSphereView *sphereView;
@property(nonatomic,strong)UISearchBar *searchBar;
@end

@implementation GDSearchViewController

@synthesize sphereView;
//@synthesize searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showSphereView];
    [self prepareSearchBar];
    [self prepareUploadButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor darkGrayColor]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBar removeFromSuperview];
    [sphereView timerStop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showSphereView{
    
    sphereView = [[DBSphereView alloc]initWithFrame:CGRectMake(10, 120, 300, 300)];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i = 0; i < 40; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:[NSString stringWithFormat:@"Fuck%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:24];
        button.frame = CGRectMake(0, 0, 60, 25);
        [button addTarget:self action:@selector(selectSphereButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:button];
        [sphereView addSubview:button];
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
    [button setTitle:@"更换一组推荐" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.layer.cornerRadius = 20;
    [button addTarget:self action:@selector(selectUploadButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)selectUploadButtonMethod:(UIButton *)send{
    
    NSLog(@"%@",send);
}

-(void)selectSphereButtonMethod:(UIButton *)send{
    
    NSLog(@"%@",send);
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
