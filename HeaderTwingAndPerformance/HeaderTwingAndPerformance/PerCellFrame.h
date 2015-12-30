//
//  PerCellFrame.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PerModel.h"
#import <UIKit/UIKit.h>
@interface PerCellFrame : NSObject
@property (nonatomic,strong)BodyModel *bodyModel;
@property (nonatomic,assign,readonly)CGRect backImage;
@property (nonatomic,assign,readonly)CGRect nameFrame;
@property (nonatomic,assign,readonly)CGRect imageview;
@property (nonatomic,assign,readonly)CGRect support;
@property (nonatomic,assign,readonly)CGRect comment;
@property (nonatomic,assign,readonly)CGRect share;
@property (nonatomic,assign,readonly)CGFloat cellHeight;
-(void)setBodyModel:(BodyModel *)bodyModel;
@end
