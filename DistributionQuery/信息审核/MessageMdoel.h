//
//  MessageMdoel.h
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageMdoel : NSObject
@property (nonatomic,copy)NSString * titleName;
@property (nonatomic,copy)NSString * messageID;
@property (nonatomic,copy)NSString * timeName;
@property (nonatomic,copy)NSString * contentName;
@property (nonatomic,assign)NSString * isNew;
-(id)initWithDic:(NSDictionary*)dic;
@end
