//
//  Performance.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "Performance.h"
#import <AFNetworking/AFNetworking.h>
#import "PerModel.h"
#import "perCell.h"
#import "PerCellFrame.h"
#import <MJRefresh/MJRefresh.h>
@interface Performance ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
    UITableView *_tablView;
}
@end

@implementation Performance

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"段子";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableView];
    // Do any additional setup after loading the view.
}
-(void)loadFromDataSource:(BOOL)bl{
    NSUInteger page = 0;
    if (bl) {
        if (_dataSource.count%10 == 0) {
            page = _dataSource.count/10;
        }else{
            [_tablView.mj_header endRefreshing];
            return;
        }
    }
    NSString *url = [NSString stringWithFormat:URL,page];

    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        PerModel *model = [[PerModel  alloc] initWithData:responseObject error:nil];
        if (!bl) {
            [_dataSource removeAllObjects];
            [_tablView reloadData];
        }
       // NSLog(@"%@",model);
        for (NSUInteger i=0; i<model.body.count; i++) {
            PerCellFrame *cellFrame = [PerCellFrame new];
            cellFrame.bodyModel = model.body[i];
            [_dataSource addObject:cellFrame];
          // NSLog(@"%@",cellFrame.bodyModel);
        }
        [_tablView reloadData];
         bl?[_tablView.mj_footer endRefreshing]:[_tablView.mj_header endRefreshing];
        // NSLog(@"%lu",_dataSource.count);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier =@"cellIdentifier";
    perCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[perCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
        
    }
    cell.perCellFrame =_dataSource[indexPath.row];
    return cell;
}
-(void)createTableView
{
    _tablView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tablView.delegate = self;
    _tablView.dataSource = self;
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadFromDataSource:NO];
    }];
    _tablView.mj_header = header;
    MJRefreshBackFooter *footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self loadFromDataSource:YES];
    }];
    _tablView.mj_footer = footer;
    [_tablView.mj_header beginRefreshing];
    [self.view addSubview:_tablView];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PerCellFrame *percell = _dataSource[indexPath.row];
    return percell.cellHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
