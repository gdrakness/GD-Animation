//
//  GDMoreTableViewController.m
//  GD超次元
//
//  Created by gdarkness on 16/8/14.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDMoreTableViewController.h"
#import "GDMoreTableViewCell.h"
#import "GDClassMoreDataModel.h"
#import "LORequestManger.h"
#import "UIImage+GDImageEffects.h"
#import "GDDetailsViewController.h"

@interface GDMoreTableViewController ()
@property(nonatomic,strong)NSMutableArray<GDMoreDataModel *>*posts;
@property(nonatomic,strong)UILabel *lable;
@end

@implementation GDMoreTableViewController
static NSString *Identifier = @"GDMoreTableViewController";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GDMoreTableViewCell class] forCellReuseIdentifier:Identifier];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.separatorStyle = NO;
    UIImage *Image = [UIImage imageNamed:@"1421035825228917"];
    UIImage *blurredImage = [Image applyBlurWithRadius:13.5f tintColor:[UIColor colorWithWhite:0 alpha:0] saturationDeltaFactor:1.1 maskImage:nil];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:blurredImage];
    imageView.frame = [UIScreen mainScreen].bounds;
//    self.tableView.backgroundView = imageView;
    
    self.navigationItem.title = _name;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:blueColor,NSForegroundColorAttributeName, nil]];
    
    [self getDataIsMore:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataIsMore:(BOOL)isMore{
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    NSString *URL = [NSString string];
    if (_catId) {
        parame[@"cat_id"] = _catId;
        URL = ClassUrl;
    }else if (!_catId){
        parame[@"name"] = _name;
        parame[@"&offset"] = @"1";
        URL = SearchUrl;
    }
   
    [LORequestManger GET:URL parame:parame success:^(id response) {
    [GDClassMoreDataModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"posts":@"GDMoreDataModel"
                 };
    }];
        GDClassMoreDataModel *dataModel = [GDClassMoreDataModel mj_objectWithKeyValues:response];
        [self.posts addObjectsFromArray:dataModel.posts];
        [self.tableView reloadData];
        if (_posts.count == 0) {
    
            _lable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width - 100 * 2, self.view.height - 200 * 2, 100, 44)];
            [_lable setText:@"该类型暂无"];
            _lable.textColor = [UIColor darkGrayColor];
            _lable.font = [UIFont systemFontOfSize: 20];
            _lable.textAlignment = NSTextAlignmentCenter;
            [self.tableView addSubview:_lable];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GDMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        [cell setModel:self.posts[indexPath.row]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GDDetailsViewController *detailsVC = [[GDDetailsViewController alloc]init];
    GDMoreDataModel *cellRow = self.posts[indexPath.row];
    detailsVC.url = cellRow.url;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

-(NSMutableArray<GDMoreDataModel *> *)posts{
    if (_posts != nil) {
        return _posts;
    }
    //实例化
    _posts = [NSMutableArray array];
    
    return _posts;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
