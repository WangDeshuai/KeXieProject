//
//  HomeTableViewCell.h
//  DistributionQuery
//
//  Created by Macx on 16/12/17.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HomeTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView CellID:(NSString*)cellID;
@property (nonatomic,strong)UIImageView * dianImage;
@property(nonatomic,strong)HomeModel * model;
@end
