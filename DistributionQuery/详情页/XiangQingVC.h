//
//  XiangQingVC.h
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "BaseViewController.h"

@interface XiangQingVC : BaseViewController
/*
 tagg==1从首页过来的
 tagg==2的时候是从未审核过来的
 */
@property (nonatomic,assign)NSInteger tagg;
@property (nonatomic,copy)NSString * messageID;
@end
