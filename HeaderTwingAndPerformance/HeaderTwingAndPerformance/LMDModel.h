//
//  LMDModel.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ItemModel


@end

//@interface ItemModel : JSONModel
//
//@property (nonatomic, copy) NSString<Optional> *thumbnail;
//@property (nonatomic, copy) NSString *online;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString <Optional>*source;
//@property (nonatomic, copy) NSString <Optional>*updateTime;
//@property (nonatomic, copy) NSString *Id;
//@property (nonatomic, copy) NSString *documentId;
//@property (nonatomic, copy) NSString *type;
//@property (nonatomic, copy) NSString <Optional>*hasSlide;
//@property (nonatomic, copy) NSString *commentsUrl;
//@property (nonatomic, copy) NSString *comments;
//@property (nonatomic, copy) NSString *commentsall;
//@property (nonatomic, copy) NSString <Optional>*linkType;
//@property (nonatomic, copy) NSString <Optional>*linkUrl;
//@property (nonatomic, copy) NSString <Optional>*styleType;
//@property (nonatomic, strong) NSMutableArray<Optional> *styleImsges;
//
//@end
//
//@interface WDXNewsModel : JSONModel
//
//@property (nonatomic, copy) NSString *listId;
//@property (nonatomic, copy) NSString *type;
//@property (nonatomic, copy) NSString *expiredTime;
//@property (nonatomic, copy) NSString *currentPage;
//@property (nonatomic, copy) NSString *totalPage;
//@property (nonatomic, strong) NSMutableArray <ItemModel>*item;
//@end
//

@interface ItemModel : JSONModel
@property (nonatomic,copy)NSString <Optional>*thumbnail;
@property (nonatomic,copy)NSString <Optional>*online;
@property (nonatomic,copy)NSString <Optional>*title;
@property (nonatomic,copy)NSString <Optional>*source;
@property (nonatomic,copy)NSString <Optional>*updateTime;

@property (nonatomic,copy)NSString <Optional>*myid;
@property (nonatomic,copy)NSString <Optional>*documentId;
@property (nonatomic,copy)NSString <Optional>*type;
@property (nonatomic,copy)NSString <Optional>*hasSlide;

@property (nonatomic,copy)NSString <Optional>*commentsUrl;
@property (nonatomic,copy)NSString <Optional>*comments;
@property (nonatomic,copy)NSString <Optional>*commentsall;
@property (nonatomic,copy)NSString <Optional>*styleType;
@property (nonatomic,copy)NSString <Optional>*linktype;
@property (nonatomic,copy)NSString <Optional>*linkurl;
@property (nonatomic,copy)NSString <Optional>*styType;
@property (nonatomic,copy)NSMutableArray<Optional>*stylimages;
@end


@interface LMDModel : JSONModel
@property (nonatomic,copy)NSString <Optional>*listId;
@property (nonatomic,copy)NSString <Optional>*type;
@property (nonatomic,copy)NSString <Optional>*expiredTime;
@property (nonatomic,copy)NSString <Optional>*currentPage;
@property (nonatomic,copy)NSString <Optional>*totalPage;
@property (nonatomic,copy)NSMutableArray<ItemModel>*item;

@end
