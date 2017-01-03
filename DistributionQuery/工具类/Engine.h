//
//  Engine.h
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(NSDictionary*dic);
typedef void (^ErrorBlock)(NSError*error);
@interface Engine : NSObject
//**********************************首页**********************//
#pragma mark --1用户登录
+(void)usetLoginAccount:(NSString*)account Password:(NSString*)password success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;

#pragma mark --2首页接口
+(void)firstJieKouType:(NSString*)type PageIndex:(NSString*)pagee success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;


#pragma mark --3查看科协要闻详情
+(void)chaXunXiangQingMessageID:(NSString*)idd success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;
#pragma mark --4提交建议
+(void)tijiaoMessageUserID:(NSString*)idd Title:(NSString*)title Content:(NSString*)content UserName:(NSString*)name PhoneNumber:(NSString*)phone success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;

#pragma mark --5查询未审核文章列表
+(void)chaXunAppWenZhangPage:(NSString*)page success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;

#pragma mark --6app 审核文章
+(void)appShenHeWenZhangMessageID:(NSString*)idd  ShenHeStype:(NSString*)stype audit_type:(NSString*)typee success:(SuccessBlock)aSuccess error:(ErrorBlock)aError;

@end
