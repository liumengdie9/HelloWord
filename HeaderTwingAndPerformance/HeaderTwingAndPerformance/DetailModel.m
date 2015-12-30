//
//  DetailModel.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "DetailModel.h"



@implementation MtaModel
+(JSONKeyMapper *)keyMapper{

    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID",@"class":@"Class"}];
}

@end
@implementation IgModel

//+(JSONKeyMapper *)keyMapper{
//
//    return [[JSONKeyMapper alloc] initWithDictionary:@{@"size.width":@"sizeWith",@"size.height":@"sizeHeight"}];
//}
//
@end

@implementation ImagSizeModel

@end

@implementation BdyModel


@end
@implementation DetailModel

@end
