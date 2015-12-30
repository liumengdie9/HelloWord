//
//  perCell.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PerCellFrame.h"
@interface perCell : UITableViewCell
@property (nonatomic,strong)UIImageView *backImage;
@property (nonatomic,strong)UILabel *content;
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UIButton *support;
@property (nonatomic,strong)UIButton *comment;
@property (nonatomic,strong)UIButton *share;
@property (nonatomic,assign)PerCellFrame *perCellFrame;
@end
