//
//  DetailModel.h
//  HeaderTwingAndPerformance
//
//  Created by qianfeng007 on 15/12/5.
//  Copyright © 2015年 刘梦蝶. All rights reserved.
//

#import <JSONModel/JSONModel.h>

//@protocol ImageModel <NSObject>
//
//@end
@interface ImagSizeModel : JSONModel
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@end

@protocol IgModel
@end

@interface IgModel : JSONModel
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) ImagSizeModel *size;

@end


//@interface ImageModel : JSONModel
//@property (nonatomic,copy)NSString<Optional> *url;
//@property (nonatomic,strong)NSString<Optional> *sizeWith;
//@property (nonatomic,strong)NSString<Optional> *sizeHeight;
//@end



@interface MtaModel : JSONModel
@property (nonatomic,copy)NSString <Optional>*ID;
@property (nonatomic,copy)NSString<Optional> *type;
@property (nonatomic,copy)NSString<Optional>*o;
@property (nonatomic,copy)NSString <Optional>*documentId;
@property (nonatomic,copy)NSString<Optional> *Class;
@end


@interface BdyModel : JSONModel
@property (nonatomic,copy)NSString<Optional>*cate;
@property (nonatomic,copy)NSString<Optional> *documentId;
@property (nonatomic,copy)NSString<Optional>*title;
@property (nonatomic,copy)NSString<Optional> *author;
@property (nonatomic,copy)NSString<Optional> *hasVideo;
@property (nonatomic,copy)NSString<Optional> *source;
@property (nonatomic,copy)NSString<Optional> *thumbnail;
@property (nonatomic,copy)NSString<Optional>*editTime;
@property (nonatomic,copy)NSString<Optional> *wapurl;
@property (nonatomic,copy)NSString<Optional>*channel;
@property (nonatomic,copy)NSString<Optional>*introduction;
@property (nonatomic,copy)NSString<Optional>*wwwurl;
@property (nonatomic,copy)NSString<Optional> *shareurl;
@property (nonatomic,copy)NSString<Optional> *commentsUrl;
@property (nonatomic,copy)NSString<Optional>*commentCount;
@property (nonatomic,copy)NSString<Optional> *text;
//@property (nonatomic,strong)NSMutableArray<IgModel>*img;
@property (nonatomic,copy)NSString<Optional> *program;
@property (nonatomic,copy)NSString<Optional>*programNo;
@property (nonatomic,copy)NSString<Optional>*sologan;
@property (nonatomic,copy)NSString<Optional> *editorcode;
@property (nonatomic,copy)NSString <Optional>*commentType;
@end

@interface DetailModel : JSONModel
@property (nonatomic,strong)MtaModel*meta;
@property (nonatomic,strong)BdyModel*body;
@end
