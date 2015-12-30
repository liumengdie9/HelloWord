//
//  Detail.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "Detail.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailModel.h"
#import <WebKit/WebKit.h>
#define CONTENTFONT [UIFont systemFontOfSize:15]
@interface Detail ()<UIWebViewDelegate>
{
    ItemModel *_model;
}
@end
@implementation Detail
-(instancetype)initWith:(ItemModel *)model{
    if (self = [super init]) {
        _model = model;
        [self crecateWebView];
    }
    return self;
}
-(void)crecateWebView{
  WKWebView *view = [[WKWebView alloc] init];
    view.frame = self.view.frame;
    view.backgroundColor = [UIColor clearColor];
    NSURL *url = [NSURL URLWithString:_model.commentsUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [view loadRequest:request];

    [self.view addSubview:view];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.automaticallyAdjustsScrollViewInsets = NO;

   // Do any additional setup after loading the view.
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
