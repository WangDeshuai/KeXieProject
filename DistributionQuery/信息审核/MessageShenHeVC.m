//
//  MessageShenHeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "MessageShenHeVC.h"
#import "MessageShenHeCell.h"
#import "MessageMdoel.h"

#import "XiangQingVC.h"
@interface MessageShenHeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,assign)int AAA;
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;


@end

@implementation MessageShenHeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArray=[NSMutableArray new];
    self.title=@"信息审核";
   
    [self CreatTabelView];
}



-(void)shujuDataPage:(NSString*)page{
    [Engine chaXunAppWenZhangPage:page success:^(NSDictionary *dic) {
        NSString * item1 =[NSString stringWithFormat:@"%@",[dic objectForKey:@"code"]];
        if ([item1 isEqualToString:@"1"]) {
            NSArray * contentArr =[dic objectForKey:@"content"];
            NSMutableArray * array2 =[NSMutableArray new];
            for (NSDictionary * dicc in contentArr) {
                MessageMdoel * model =[[MessageMdoel alloc]initWithDic:dicc];
                [array2 addObject:model];
            }
            
            if (self.myRefreshView == _tableView.header) {
                _dataArray = array2;
                _tableView.footer.hidden = _dataArray.count==0?YES:NO;
            }else if(self.myRefreshView == _tableView.footer){
                [_dataArray addObjectsFromArray:array2];
            }
            
            
            [_tableView reloadData];
            [_myRefreshView  endRefreshing];
            
        }else{
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        }
    } error:^(NSError *error) {
        
    }];
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
    
    //
    //刷新操作
    __weak typeof (self) weakSelf =self;
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"往下拉了");
        _AAA=1;
        weakSelf.myRefreshView = weakSelf.tableView.header;
       
        [self shujuDataPage:[NSString stringWithFormat:@"%d",_AAA]];
    }];
    
    // 马上进入刷新状态
    [_tableView.header beginRefreshing];
    //..上拉刷新
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.myRefreshView = weakSelf.tableView.footer;
        NSLog(@"往上拉了加载更多");
        _AAA=_AAA+1;
        [self shujuDataPage:[NSString stringWithFormat:@"%d",_AAA]];
    }];
    _tableView.footer.hidden = YES;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageShenHeCell * cell =[MessageShenHeCell cellWithTableView:tableView CellID:[NSString stringWithFormat:@"%lu%lu",indexPath.section,indexPath.row] ];
    cell.model=_dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageMdoel * md =_dataArray[indexPath.row];
    XiangQingVC * vc =[XiangQingVC new];
    vc.tagg=2;
    vc.messageID=md.messageID;
    [self.navigationController pushViewController:vc animated:YES];
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
