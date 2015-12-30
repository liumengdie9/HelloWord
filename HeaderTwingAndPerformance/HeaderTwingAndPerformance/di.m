//
//  HeaderTwing.m
//  
//
//  Created by qianfeng007 on 15/12/5.
//
//

#import "HeaderTwing.h"
#import <AFNetworking/AFNetworking.h>
#import "LMDModel.h"
#import "LMDCell.h"
#import <UIImageView+WebCache.h>
#import "Detail.h"
#import <MJRefresh/MJRefresh.h>
#define URL @"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10,SYRECOMMEND&page=%ld"
@interface HeaderTwing ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIScrollView *_scroll;
    UITableView *_tablView;
    NSMutableArray *_dataSource;
    NSMutableArray *_data;
    UITableViewCell *_cell;
    NSMutableArray *_imageArry;
}

@end

@implementation HeaderTwing

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"头条";
    _data = [[NSMutableArray alloc] init];
    _dataSource = [[NSMutableArray alloc] init];
    _imageArry = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createScence];
    [self createTableView];
}
-(void)createImage{
    _scroll.delegate = self;
    for (NSUInteger i=0; i<_data.count+2; i++) {
        UIImageView *view= [[UIImageView alloc] init];
        view.frame = CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, 200);
        view.tag = (i-1+_data.count)%_data.count;
        [self setImage:view];
        [_scroll addSubview:view];
        _scroll.contentSize = CGSizeMake(self.view.frame.size.width*5, 200);
        [_imageArry addObject:view];
    }
  _scroll.contentOffset = CGPointMake(_scroll.frame.size.width, 0);
}
-(void)setImage:(UIImageView *)view{
    [view sd_setImageWithURL:[NSURL URLWithString:[_data[view.tag] thumbnail]] placeholderImage:nil];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

  [self setImage];
}

-(void)setImage{
    CGFloat width = _scroll.contentOffset.x;
    if (width == _scroll.frame.size.width*4) {
        _scroll.contentOffset =CGPointMake(self.view.frame.size.width, 0);
    }else if(width ==0){
        _scroll.contentOffset =CGPointMake(3*self.view.frame.size.width, 0);
    }
}
-(void)createScence{
    _scroll = [[UIScrollView alloc] init];
    _scroll.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    _scroll.backgroundColor = [UIColor grayColor];
    _scroll.pagingEnabled = YES;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return 150;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Detail *detail = [[Detail alloc] initWith:_dataSource[indexPath.row]];
    detail.view.backgroundColor = [UIColor cyanColor];
    [self.navigationController pushViewController:detail animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemModel *item = _dataSource[indexPath.row];
    if (item.stylimages.count) {
        static NSString *identifier =@"cellIdentifier";
        LMDCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[LMDCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
           
            
        }
         [cell updataSource:_dataSource[indexPath.row]];
        return cell;
    }else{
        static NSString *identifier =@"cellIdentifier1";
        LMDCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[LMDCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
           
           
        }
        [cell updataSource:_dataSource[indexPath.row]];
        return cell;
    }
    return nil;
}
-(void)createTableView
{
    _tablView = [[UITableView alloc] init];
    _tablView.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
    _tablView.backgroundColor = [UIColor whiteColor];
    _tablView.delegate = self;
    _tablView.dataSource = self;
    _tablView.tableHeaderView = _scroll;
    MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadFromDataSouece:NO];
    }];
    _tablView.mj_header = header;
    MJRefreshBackFooter *footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self loadFromDataSouece:YES];
    }];
    _tablView.mj_footer = footer;
    [_tablView.mj_header beginRefreshing];
    [self.view addSubview:_tablView];
    
}
-(void)loadFromDataSouece:(BOOL)bl{
    NSUInteger page = 1;
    if (bl) {
        if (_dataSource.count%19 > 0) {
            page = _dataSource.count/19+1;
        }else{
            [_tablView.mj_header endRefreshing];
            return;
        }
    }
        NSString *url = [NSString stringWithFormat:URL,page];
    AFHTTPRequestOperationManager *manger =[AFHTTPRequestOperationManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *ary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        if (!bl) {
            [_dataSource removeAllObjects];
            [_tablView reloadData];
        }
        for (NSUInteger i=0 ;i<ary.count;i++) {
           LMDModel *model = [[LMDModel alloc] initWithDictionary:ary[i] error:nil];
            if (i==0) {
                for (NSUInteger i=0;i<model.item.count;i++) {
                    ItemModel *itemModel = model.item[i];
                    [_dataSource addObject:itemModel];
                }
            }else if (i==1){
                for (NSUInteger i=0;i<model.item.count;i++) {
                    ItemModel *itemModel = model.item[i];
                    [_data addObject:itemModel];
                    [self createImage];
                }

            }
        }
        [_tablView reloadData];
        bl?[_tablView.mj_footer endRefreshing]:[_tablView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
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
