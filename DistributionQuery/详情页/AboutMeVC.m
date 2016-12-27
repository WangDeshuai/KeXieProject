//
//  AboutMeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/23.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "AboutMeVC.h"

@interface AboutMeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation AboutMeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"关于我们";
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArray=@[@"客服电话",@"QQ号码",@"官网"];
    [self CreatTabelView];
}

-(UIView*)CreatTabelViewHead{
    UIView * headView =[UIView new];
    headView.backgroundColor=COLOR;
    headView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(200);
    //logo
    UIImageView * imageview =[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"about_logo"];
    [headView sd_addSubviews:@[imageview]];
    imageview.sd_layout
    .topSpaceToView(headView,50)
    .centerXEqualToView(headView)
    .widthIs(142/2)
    .heightIs(142/2);
    //label
   UILabel* logoName=[UILabel new];
    logoName.text=@"河北省科学技术协会";
    logoName.textColor=[UIColor blackColor];
    logoName.font=[UIFont systemFontOfSize:14];
    [headView sd_addSubviews:@[logoName]];
    logoName.sd_layout
    .centerXEqualToView(imageview)
    .topSpaceToView(imageview,15)
    .heightIs(20);
    [logoName setSingleLineAutoResizeWithMaxWidth:ScreenWidth];

    
    return headView;
}


-(void)CreatTabelView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=COLOR;
    _tableView.tableHeaderView=[self CreatTabelViewHead];
    _tableView.tableFooterView=[UIView new];
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text=_dataArray[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.alpha=.6;
    cell.textLabel.textAlignment=1;
    cell.textLabel.textColor=[UIColor blackColor];
    
    cell.detailTextLabel.text=@"123";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
 }
@end
