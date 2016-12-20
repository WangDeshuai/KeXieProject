//
//  HomeTableViewCell.h
//  DistributionQuery
//
//  Created by Macx on 16/12/17.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView CellID:(NSString*)cellID;
@property (nonatomic,strong)UIImageView * dianImage;
@end
