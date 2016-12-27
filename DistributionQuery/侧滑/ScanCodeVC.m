//
//  ScanCodeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "ScanCodeVC.h"
#import "LoginVC.h"
#import "MessageShenHeVC.h"
@interface ScanCodeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tabelView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation ScanCodeVC
-(void)viewWillAppear:(BOOL)animated{
    _tabelView.tableHeaderView=[self CreatHeadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self CreatData];
    UIImageView * imageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_bg"]];
    imageview.userInteractionEnabled=YES;
    imageview.frame=self.view.bounds;
    [self.view addSubview:imageview];
    [self CreatTabelView];
   
}

#pragma mark --创建表头
-(UIView*)CreatHeadView{
    UIView * headView =[UIView new];
    headView.backgroundColor=[UIColor clearColor];
    
    headView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,20)
    .heightIs(120);
    
    
    UIButton * headBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [headBtn setBackgroundImage:[UIImage imageNamed:@"home_person"] forState:0];
    headBtn.sd_cornerRadius=@(106/4);
    [headView sd_addSubviews:@[headBtn]];
    headBtn.sd_layout
    .leftSpaceToView(headView,15)
    .topSpaceToView(headView,30)
    .widthIs(106/2)
    .heightIs(106/2);
    
    UILabel * nameLabel =[UILabel new];
    nameLabel.textColor=[UIColor whiteColor];
    nameLabel.font=[UIFont systemFontOfSize:15];
    if ([ToolClass isLogin]==NO) {
        nameLabel.text=@"未登录";
    }else{
        nameLabel.text=[NSUSE_DEFO objectForKey:@"account"];
    }
   
    [headView sd_addSubviews:@[nameLabel]];
    nameLabel.sd_layout
    .leftSpaceToView(headBtn,15)
    .centerYEqualToView(headBtn)
    .heightIs(20);
    [nameLabel setupAutoWidthWithRightView:headView rightMargin:20];
    
    return headView;
}
#pragma mark --创建数据源
-(void)CreatData{
    NSArray * array1 =@[@"科协动态",@"意见建议"];
    NSArray * array2 =@[@""];
    NSArray * array3 =@[@"用户登录",@"用户申请"];
    NSArray * array4 =@[@"通讯录",@"信息审核"];
    _dataArray=[[NSMutableArray alloc]initWithObjects:array1,array2,array3,array4, nil];
}





#pragma mark --创建表
-(void)CreatTabelView{
    if (!_tabelView) {
        _tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    }
    _tabelView.dataSource=self;
    _tabelView.delegate=self;
    _tabelView.tableHeaderView=[self CreatHeadView];
    _tabelView.tableFooterView=[UIView new];
    _tabelView.backgroundColor=[UIColor clearColor];
    _tabelView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabelView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   
    return [_dataArray[section] count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        UILabel * textlable =[UILabel new];
        textlable.tag=10;
        [cell sd_addSubviews:@[textlable]];
        //线条
        UIImageView * lineImage =[UIImageView new];
        lineImage.tag=11;
        [cell sd_addSubviews:@[lineImage]];
    }
    cell.backgroundColor=[UIColor clearColor];
    UILabel * textlabel =(UILabel*)[cell viewWithTag:10];
    UIImageView * lineImage =(UIImageView*)[cell viewWithTag:11];
    //文字
   textlabel.text=_dataArray[indexPath.section][indexPath.row];
   textlabel.textColor=[UIColor whiteColor];
   textlabel.font=[UIFont systemFontOfSize:14];
   textlabel.sd_layout
    .leftSpaceToView(cell,15+20+30)
    .centerYEqualToView(cell)
    .heightIs(20);
    [textlabel setSingleLineAutoResizeWithMaxWidth:200];
    //线条
    lineImage.image=[UIImage imageNamed:@"home_line"];
    lineImage.hidden=YES;
    lineImage.sd_layout
    .leftSpaceToView(cell,0)
    .bottomSpaceToView(cell,1)
    .widthIs(350/2)
    .heightIs(1);
    if (indexPath.section==1) {
        lineImage.hidden=NO;
    }
    else if (indexPath.section==0 || indexPath.section==2){
        if (indexPath.row==1) {
            lineImage.hidden=NO;
        }
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        return 5;
    }else{
        return 44;
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * bgView =[UIView new];
    bgView.backgroundColor=[UIColor clearColor];
    NSArray * imageArr =@[@"home_gz",@"home_gg",@"home_gl",@"home_yy"];
    NSArray * titleArr =@[@"科协工作",@"公共服务",@"用户管理",@"我的应用"];
    
    //图片
    UIImageView * imageview =[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:imageArr[section]];
    [bgView sd_addSubviews:@[imageview]];
    imageview.sd_layout
    .leftSpaceToView(bgView,30)
    .centerYEqualToView(bgView)
    .widthIs(43/2)
    .heightIs(38/2);
    //文字
    UILabel * nameLabel =[UILabel new];
    nameLabel.textColor=[UIColor whiteColor];
    nameLabel.font=[UIFont systemFontOfSize:17];
    nameLabel.text=titleArr[section];
    [bgView sd_addSubviews:@[nameLabel]];
    nameLabel.sd_layout
    .leftSpaceToView(imageview,10)
    .centerYEqualToView(imageview)
    .heightIs(20);
    [nameLabel setupAutoWidthWithRightView:bgView rightMargin:20];
    
    
    
    
    return bgView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tabelView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            //科协动态
        }else{
            //意见建议
            MyVC * vc =[MyVC new];
            BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:vc];
            [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:navController animated:YES];
        }
        
    }else  if (indexPath.section==2) {
        if (indexPath.row==0) {
          //用户登录
            if ([ToolClass isLogin]==NO) {
                LoginVC * vc =[LoginVC new];
                [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:vc animated:YES];
            }else{
                [LCProgressHUD showMessage:@"用户已登录"];
            }
            
        }else{
            //用户申请
        }
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            //通讯录
        }else{
            //信息审核
            if ([ToolClass isLogin]==YES) {
                MessageShenHeVC * vc =[MessageShenHeVC new];
                BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:vc];
                [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:navController animated:YES];
            }else{
                //没登录进入登录界面
                LoginVC * vc =[LoginVC new];
                [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:vc animated:YES];
            }
        }
    }
    
    
}













-(void)wangji{
    
     MyVC * vc =[MyVC new];
     BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:vc];
      [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:navController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
