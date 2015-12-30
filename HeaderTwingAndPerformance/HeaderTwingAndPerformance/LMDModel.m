//
//  LMDModel.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "LMDModel.h"
#import <JSONKeyMapper.h>
@implementation ItemModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"myid",@"link.type":@"linktype",@"link.url":@"linkurl",@"style.type":@"styType",@"style.images":@"stylimages"}];
}
@end

@implementation LMDModel

@end

//@implementation WDXNewsModel
//
//@end