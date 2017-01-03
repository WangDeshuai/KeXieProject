//
//  HomeModel.m
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
-(id)initWithDic:(NSDictionary*)dic{
    self=[super init];
    if (self) {
        _messageID=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]]];
        _titleName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]]];
        _urlStr=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"slt"]]];
        _timeName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"savetime"]]];
         _contentName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"content"]]];
        _isNew=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"isNew"]]];
    }
    
    return self;
}
//详情页
-(id)initWithXiangQingDic:(NSDictionary*)dic{
    self=[super init];
    if (self) {
          _titleName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]]];
         _contentName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"content"]]];
         _timeName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"savetime"]]];
    }
    
    return self;
}
@end
