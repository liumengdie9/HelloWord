//
//  PerModel.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/6.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@interface ImageSizeModel : JSONModel
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@end

@protocol ImgModel
@end

@interface ImgModel : JSONModel
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) ImageSizeModel *size;

@end

@protocol BodyModel
@end

@interface BodyModel : JSONModel
@property (nonatomic, copy) NSString *jId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString<Optional> *content;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString<Optional> *source;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *commentsUrl;
@property (nonatomic, copy) NSString *ctime;
@property (nonatomic, copy) NSString<Optional> *staticImg;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *commentsall;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, strong)NSMutableArray<ImgModel>*img;

@end

@interface MetaModel : JSONModel
@property (nonatomic, copy) NSString *mId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *expiredTime;
@property (nonatomic, copy) NSString *pageSize;
@end


@interface PerModel : JSONModel
@property (nonatomic, strong) MetaModel *meta;
@property (nonatomic, strong) NSMutableArray<BodyModel>*body;

@end
