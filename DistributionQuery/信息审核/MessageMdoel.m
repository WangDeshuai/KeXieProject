//
//  MessageMdoel.m
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "MessageMdoel.h"

@implementation MessageMdoel
-(id)initWithDic:(NSDictionary*)dic{
    self=[super init];
    if (self) {
        _messageID=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]]];
        _titleName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]]];
       
        _timeName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"savetime"]]];
        _contentName=[ToolClass isString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"content"]]];
    }
    
    return self;
}
@end
