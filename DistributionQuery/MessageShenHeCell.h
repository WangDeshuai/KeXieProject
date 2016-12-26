//
//  MessageShenHeCell.h
//  DistributionQuery
//
//  Created by Macx on 16/12/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageMdoel.h"
@interface MessageShenHeCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView CellID:(NSString*)cellID;
@property(nonatomic,strong)MessageMdoel * model;
@end
