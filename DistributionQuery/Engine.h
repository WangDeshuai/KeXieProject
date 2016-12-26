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

@end
