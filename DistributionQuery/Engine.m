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







@end
