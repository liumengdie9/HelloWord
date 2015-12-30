//
//  perCell.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "perCell.h"
#import <UIImageView+WebCache.h>
@implementation perCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self custom];
    }
    return self;

}
-(void)custom{
    _backImage = [[UIImageView alloc] init];
    _backImage.image = [UIImage imageNamed:@"block_center_background"];
    _content = [[UILabel alloc] init];
    _content.numberOfLines = 0;
    _content.font = [UIFont systemFontOfSize:15];
    _imageview = [[UIImageView alloc] init];
    _support = [UIButton buttonWithType:UIButtonTypeSystem];
    _comment = [UIButton buttonWithType:UIButtonTypeSystem];
    _share = [UIButton buttonWithType:UIButtonTypeSystem];
    [_support setImage:[UIImage imageNamed:@"icon_for_gd"] forState:UIControlStateNormal];
    [_comment setImage:[[UIImage imageNamed:@"icon_for_comment"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [_share setImage:[UIImage imageNamed:@"icon_tg"] forState:UIControlStateNormal];
    [self.contentView addSubview:_backImage];
    [self.contentView addSubview:_content];
    [self.contentView addSubview:_imageview];
    [self.contentView addSubview:_support];
    [self.contentView addSubview:_comment];
    [self.contentView addSubview:_share];
}
-(void)setPerCellFrame:(PerCellFrame *)perCellFrame{
    
    _backImage.frame = perCellFrame.backImage;
    _content.frame = perCellFrame.nameFrame;
    _content.text = perCellFrame.bodyModel.content;
    _imageview.frame = perCellFrame.imageview;
    if (perCellFrame.bodyModel.img.count>0) {
        [_imageview sd_setImageWithURL:[perCellFrame.bodyModel.img[0] url] placeholderImage:nil];
    }
    _support.frame = perCellFrame.support;
    
    [_support setTitle:perCellFrame.bodyModel.likes forState:UIControlStateNormal];
    _comment.frame = perCellFrame.comment;
   
    [_comment setTitle:perCellFrame.bodyModel.comments forState:UIControlStateNormal];
    _share.frame = perCellFrame.share;
    
    [_share setTitle:perCellFrame.bodyModel.commentsall forState:UIControlStateNormal];    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
