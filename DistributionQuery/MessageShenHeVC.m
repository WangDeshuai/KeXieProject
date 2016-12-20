//
//  MessageShenHeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "MessageShenHeVC.h"
#import "MessageShenHeCell.h"
@interface MessageShenHeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation MessageShenHeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"信息审核";
    [self CreatTabelView];
}
-(void)CreatTabelView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[UIView new];
    _tableView.backgroundColor=COLOR;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageShenHeCell * cell =[MessageShenHeCell cellWithTableView:tableView CellID:[NSString stringWithFormat:@"%lu%lu",indexPath.section,indexPath.row] ];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView =[UIView new];
    bgView.backgroundColor=COLOR;
    
    UIView * headView =[UIView new];
    headView.backgroundColor=[UIColor whiteColor];
    [bgView sd_addSubviews:@[headView]];
    headView.sd_layout
    .leftSpaceToView(bgView,0)
    .rightSpaceToView(bgView,0)
    .topSpaceToView(bgView,10)
    .heightIs(50);
    
    //竖线
    UIImageView * imageview =[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"xxsh_line"];
    [headView sd_addSubviews:@[imageview]];
    imageview.sd_layout
    .leftSpaceToView(headView,15)
    .centerYEqualToView(headView)
    .widthIs(6/2)
    .heightIs(31/2);
    //字
    UILabel * nameLabel =[UILabel new];
    nameLabel.text=@"未审核的信息";
    nameLabel.alpha=.7;
    nameLabel.font=[UIFont systemFontOfSize:16];
    [headView sd_addSubviews:@[nameLabel]];
    nameLabel.sd_layout
    .leftSpaceToView(imageview,10)
    .centerYEqualToView(headView)
    .heightIs(20);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    //图标
    UIImageView * newImage =[[UIImageView alloc]init];
    newImage.image=[UIImage imageNamed:@"new"];
    [headView sd_addSubviews:@[newImage]];
    newImage.sd_layout
    .topSpaceToView(headView,5)
    .leftSpaceToView(nameLabel,0)
    .widthIs(47/2)
    .heightIs(29/2);
    
    
    return bgView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 180;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
