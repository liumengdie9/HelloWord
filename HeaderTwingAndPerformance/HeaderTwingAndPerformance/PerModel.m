//
//  PerModel.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "PerModel.h"
@implementation ImageSizeModel
@end

@implementation ImgModel

@end
@implementation BodyModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"jId"}];
}
@end
@implementation MetaModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"mId"}];
}
@end

@implementation PerModel

@end
