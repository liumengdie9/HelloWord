//
//  PerCellFrame.m
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import "PerCellFrame.h"
#define CONTENTFONT [UIFont systemFontOfSize:15]
@implementation PerCellFrame
-(void)setBodyModel:(BodyModel *)bodyModel{
    _bodyModel = bodyModel;
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat topPading = 10;
    CGFloat leftPodding = 20;
    CGFloat rightPoding=20;
    CGFloat contentHeight = [self sizeWithText:bodyModel.content maxSize:CGSizeMake(width-leftPodding-rightPoding, MAXFLOAT) font:CONTENTFONT].height;
    _nameFrame = CGRectMake(leftPodding, topPading, width-leftPodding-rightPoding, contentHeight);
    if (bodyModel.img.count!=0) {
        _imageview = CGRectMake(leftPodding, CGRectGetMaxY(_nameFrame)+10, width-leftPodding-rightPoding, 200);
        _support = CGRectMake(leftPodding, CGRectGetMaxY(_imageview)+10 , (width-leftPodding-rightPoding-20*2)/3, 20);
    }else{
        _imageview = CGRectZero;
        _support =CGRectMake(leftPodding, CGRectGetMaxY(_nameFrame)+10, (width-leftPodding-rightPoding-20*2)/3, 20);
    }
    _comment = CGRectMake(CGRectGetMaxX(_support)+20,_support.origin.y, _support.size.width, 20);
    _share = CGRectMake(CGRectGetMaxX(_comment)+20,_support.origin.y, _support.size.width, 20);
    _backImage = CGRectMake(0, 0, width, CGRectGetMaxY(_support)+5);
    _cellHeight = _backImage.size.height+20;
    
}
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}
@end
