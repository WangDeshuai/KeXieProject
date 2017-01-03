//
//  Engine.m
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "Engine.h"
#import "AFNetworking.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
@implementation Engine
#pragma mark --1用户登录
+(void)usetLoginAccount:(NSString*)account Password:(NSString*)password success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    NSString * urlStr =[NSString stringWithFormat:@"%@login/app_auditLogin.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    [dic setObject:account forKey:@"account"];
    [dic setObject:password forKey:@"password"];
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"1用户登录%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"1用户登录%@",error);
        [LCProgressHUD hide];
    }];
    
    
}
#pragma mark --2首页接口
+(void)firstJieKouType:(NSString*)type PageIndex:(NSString*)pagee success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    NSString * urlStr =[NSString stringWithFormat:@"%@product/app_qryProductByTypeclass.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    NSLog(@">>>%@>>>%@",type,pagee);
    [dic setObject:type forKey:@"typeclass"];
    [dic setObject:pagee forKey:@"pageIndex"];
    [dic setObject:@"10" forKey:@"pageSize"];
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"2首页接口%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"2首页接口%@",error);
        [LCProgressHUD hide];
    }];
    
}
#pragma mark --3查看科协要闻详情
+(void)chaXunXiangQingMessageID:(NSString*)idd success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    NSString * urlStr =[NSString stringWithFormat:@"%@product/app_viewProductDetail.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    [dic setObject:idd forKey:@"product_id"];
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"3查看科协要闻详情%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"3查看科协要闻详情%@",error);
        [LCProgressHUD hide];
    }];

    
}
#pragma mark --4提交建议
+(void)tijiaoMessageUserID:(NSString*)idd Title:(NSString*)title Content:(NSString*)content UserName:(NSString*)name PhoneNumber:(NSString*)phone success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    NSString * urlStr =[NSString stringWithFormat:@"%@suggestion/app_giveSuggestion.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    if ([ToolClass isLogin]==YES) {
       [dic setObject:idd forKey:@"user_id"];
    }
    [dic setObject:title forKey:@"title"];
    [dic setObject:content forKey:@"content"];
    [dic setObject:name forKey:@"name"];
    [dic setObject:phone forKey:@"telephone"];
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"4提交建议%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"4提交建议%@",error);
        [LCProgressHUD hide];
    }];
}

#pragma mark --5查询未审核文章列表
+(void)chaXunAppWenZhangPage:(NSString*)page success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    
    NSString * urlStr =[NSString stringWithFormat:@"%@product/app_qryNotAuditProducts.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    if ([ToolClass isLogin]==YES) {
        [dic setObject:@"173" forKey:@"user_id"];
    }
    [dic setObject:page forKey:@"pageIndex"];
    [dic setObject:@"10" forKey:@"pageSize"];

    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"5查询未审核文章列表%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"5查询未审核文章列表%@",error);
        [LCProgressHUD hide];
    }];
    
    
}
#pragma mark --6app 审核文章
+(void)appShenHeWenZhangMessageID:(NSString*)idd  ShenHeStype:(NSString*)stype audit_type:(NSString*)typee success:(SuccessBlock)aSuccess error:(ErrorBlock)aError{
    
    NSString * urlStr =[NSString stringWithFormat:@"%@product/app_auditProduct.action",SER_VICE];
    NSMutableDictionary * dic =[NSMutableDictionary new];
    if ([ToolClass isLogin]==YES) {
        [dic setObject:[NSUSE_DEFO objectForKey:@"token"] forKey:@"user_id"];
    }
    [dic setObject:idd forKey:@"product_id"];
    [dic setObject:stype forKey:@"audit_status"];
     [dic setObject:typee forKey:@"audit_type"];
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"6app 审核文章%@",str);
        
        aSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"6app 审核文章%@",error);
        [LCProgressHUD hide];
    }];
    
    
    
}



@end
