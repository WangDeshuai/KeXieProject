//
//  HomeModel.h
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (nonatomic,copy)NSString * urlStr;
@property (nonatomic,copy)NSString * titleName;
@property (nonatomic,copy)NSString * messageID;
@property (nonatomic,copy)NSString * timeName;
@property (nonatomic,copy)NSString * contentName;
@property (nonatomic,assign)NSString * isNew;
//首页
-(id)initWithDic:(NSDictionary*)dic;
//详情页
-(id)initWithXiangQingDic:(NSDictionary*)dic;
@end
