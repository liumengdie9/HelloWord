//
//  LMDCell.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMDModel.h"
@interface LMDCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UIImageView *imageview1;
@property (nonatomic,strong)UIImageView *imageview2;
@property (nonatomic,strong)UIImageView *imageview3;
@property (nonatomic,strong)UIImageView *imageview4;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UIButton *commentsall;
@property (nonatomic,strong)UILabel *updataTime;

-(void)updataSource:(ItemModel *)item;

@end
