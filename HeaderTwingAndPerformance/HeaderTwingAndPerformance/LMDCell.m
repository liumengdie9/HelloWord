//
//  LMDCell.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "LMDCell.h"
#import <UIImageView+WebCache.h>
@implementation LMDCell
{
    NSArray *_ary;
    ItemModel *_model;
}
- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if ([reuseIdentifier isEqualToString:@"cellIdentifier"]) {
            _imageview1 = [[UIImageView alloc] init];
            _imageview2 = [[UIImageView alloc] init];
            _imageview3 = [[UIImageView alloc] init];
            _imageview4 = [[UIImageView alloc] init];
            [self.contentView addSubview:_imageview1];
            [self.contentView addSubview:_imageview2];
            [self.contentView addSubview:_imageview3];
            [self.contentView addSubview:_imageview4];
            _ary = @[_imageview1,_imageview2,_imageview3,_imageview4];
        }else{
        _imageview = [[UIImageView alloc] init];
       _commentsall =[UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_imageview];
        [self.contentView addSubview:_commentsall];
        }
        _updataTime = [[UILabel alloc] init];
         _name = [[UILabel alloc] init];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_updataTime];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = self.contentView.frame.size;
    if ([self.reuseIdentifier isEqualToString:@"cellIdentifier"]) {
        for (NSUInteger i=0; i<_model.stylimages.count; i++) {
            _name.frame = CGRectMake(15, 10, size.width-30, 20);
            if (i>_ary.count) {
                return;
            }
            [(UIImageView *)_ary[i] setFrame:CGRectMake(20+(5+60)*i, CGRectGetMaxY(_name.frame)+10, 60, 60)];
            [(UIImageView *)_ary[i] sd_setImageWithURL:[NSURL URLWithString:_model.stylimages[i]]];
        }
       _updataTime.frame = CGRectMake(20,120,size.width-40, 15);
    }else if ([self.reuseIdentifier isEqualToString:@"cellIdentifier1"]){
        _imageview.frame = CGRectMake(20, 20, 100, 100);
        _imageview.backgroundColor = [UIColor redColor];
        _name.frame =CGRectMake(CGRectGetMaxX(_imageview.frame)+20, 20,self.contentView.frame.size.width-CGRectGetMaxX(_imageview.frame)-20, 50);
        _name.numberOfLines = 0;
        _name.adjustsFontSizeToFitWidth = YES;
        _updataTime.frame = CGRectMake(CGRectGetMaxX(_imageview.frame),CGRectGetMaxY(_imageview.frame)-10, (CGRectGetWidth(_name.frame)-20)/2, 30);
        _commentsall.frame = CGRectMake(CGRectGetMaxX(_updataTime.frame)+20,CGRectGetMaxY(_imageview.frame)-10, (CGRectGetWidth(_name.frame)-20)/2, 30);
        [_commentsall setImage:[UIImage imageNamed:@"icon_for_comment"] forState:UIControlStateNormal];
        [_commentsall setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }

}
-(void)updataSource:(ItemModel *)item{
    _model = item;
    _updataTime.adjustsFontSizeToFitWidth = YES;
   [_imageview sd_setImageWithURL:[NSURL URLWithString:item.thumbnail] placeholderImage:nil];
    _name.text =item.title;
    [_commentsall setTitle:item.commentsall forState:UIControlStateNormal];
    _updataTime.text =item.updateTime;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
