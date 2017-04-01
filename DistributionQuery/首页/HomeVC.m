//
//  HomeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "HomeVC.h"
#import "HomeTableViewCell.h"
#import "LrdOutputView.h"
#import "AboutMeVC.h"
#import "HomeModel.h"
#import "XiangQingVC.h"
@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,LrdOutputViewDelegate>
@property(nonatomic,strong)UIView * view1;
@property(nonatomic,strong)UIButton * lastBtn;
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;
@property(nonatomic,strong)NSArray * menuArr;
@property (nonatomic, strong) LrdOutputView *outputView;//下拉菜单
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,assign)int AAA;
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;

@end

@implementation HomeVC

//隐藏tabbar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}



-(void)viewWillAppear:(BOOL)animated
{
    NSString * str =[[NSUserDefaults standardUserDefaults]objectForKey:@"退出"];
    if (str) {
        UIAlertController * alertView =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否确认退出" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 =[UIAlertAction actionWithTitle:@"是" style:0 handler:^(UIAlertAction * _Nonnull action) {
            [NSUSE_DEFO removeObjectForKey:@"token"];
            [NSUSE_DEFO removeObjectForKey:@"退出"];
            [NSUSE_DEFO synchronize];
            if ([NSUSE_DEFO objectForKey:@"token"]==nil) {
                [LCProgressHUD showMessage:@"退出成功"];
            }
        }];
        UIAlertAction * action2 =[UIAlertAction actionWithTitle:@"否" style:0 handler:nil];
        [alertView addAction:action2];
        [alertView addAction:action1];
        [NSUSE_DEFO removeObjectForKey:@"退出"];
        [NSUSE_DEFO synchronize];
        [self presentViewController:alertView animated:YES completion:nil];
    }
}

// //显示tabbar
//- (void)showTabBar
//
//{
//    if (self.tabBarController.tabBar.hidden == NO)
//    {
//        return;
//    }
//    UIView *contentView;
//    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
//        
//        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
//    
//    else
//        
//        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
//    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
//    self.tabBarController.tabBar.hidden = NO;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     //[self.navigationItem setTitle:@"河北省科学技术协会"];
    self.title=@"河北省科学技术协会";
    self.backHomeBtn.hidden=YES;
    _dataArray=[NSMutableArray new];
    [self hideTabBar];
    [self CeratLeftButton];
    [self CreatTopView];
    [self CreatTableView];
}

-(void)CeratLeftButton{
    //做按钮
    UIButton * leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 40, 40);
    [leftBtn setImage:[UIImage imageNamed:@"gzdt_cd"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBtn2 =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItems=@[leftBtn2];
    //右按钮
    UIButton * rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, 40, 40);
    [rightBtn setImage:[UIImage imageNamed:@"gzdt_sz"] forState:UIControlStateNormal];
    UIBarButtonItem * rightBtn2 =[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
     [rightBtn addTarget:self action:@selector(sheZhiBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItems=@[rightBtn2];

    //下拉菜单
    LrdCellModel *one = [[LrdCellModel alloc] initWithTitle:@"关于我们" imageName:@"shezhi_us"];
    LrdCellModel *two = [[LrdCellModel alloc] initWithTitle:@"退出登录" imageName:@"shezhi_tuichu"];
    self.menuArr = @[one, two];
}
#pragma mark --作按钮侧滑
-(void)leftButton{
    [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController showLeftController:YES];
    
}
#pragma mark --右按钮设置
-(void)sheZhiBtn:(UIButton*)btn{
    CGFloat x = btn.center.x+20;
    CGFloat y = btn.frame.origin.y + btn.bounds.size.height + 25;
    _outputView = [[LrdOutputView alloc] initWithDataArray:self.menuArr origin:CGPointMake(x, y) width:130 height:50 direction:kLrdOutputViewDirectionRight];
    _outputView.alpha=.4;
    _outputView.fount=15;
    _outputView.delegate = self;
    _outputView.dismissOperation = ^(){
        //设置成nil，以防内存泄露
        _outputView = nil;
    };
    [_outputView pop];
    
}

- (void)didSelectedAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row==0) {
        //关于我们
        AboutMeVC * vc =[AboutMeVC new];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        //退出
        UIAlertController * alertView =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否确认退出" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 =[UIAlertAction actionWithTitle:@"是" style:0 handler:^(UIAlertAction * _Nonnull action) {
            [NSUSE_DEFO removeObjectForKey:@"token"];
            [NSUSE_DEFO synchronize];
            if ([NSUSE_DEFO objectForKey:@"token"]==nil) {
                [LCProgressHUD showMessage:@"退出成功"];
            }
        }];
        UIAlertAction * action2 =[UIAlertAction actionWithTitle:@"否" style:0 handler:nil];
        [alertView addAction:action2];
        [alertView addAction:action1];
        [self presentViewController:alertView animated:YES completion:nil];
    }
    
}

#pragma mark --创建顶端标题
-(void)CreatTopView{
    _view1=[UIView new];
    _view1.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[_view1]];
    _view1.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(35);
    //lineView
    _lineView=[UIView new];
    _lineView.backgroundColor=JXColor(0, 133, 207, 1);
    [_view1 sd_addSubviews:@[_lineView]];
    
    NSArray * titleArr =@[@"科协要闻",@"工作动态",@"通知公告"];
    int d =(ScreenWidth-100*titleArr.count)/(titleArr.count +1);
    for (int i =0; i<titleArr.count; i++) {
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
       // btn.backgroundColor=[UIColor redColor];
        [btn setTitle:titleArr[i] forState:0];
        btn.titleLabel.font=[UIFont systemFontOfSize:16];
        btn.alpha=.7;
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setTitleColor:JXColor(0, 133, 207, 1) forState:UIControlStateSelected];
        btn.tag=i;
        [btn addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            btn.selected=YES;
            _lastBtn=btn;
            _lineView.sd_layout
            .leftEqualToView(btn)
            .rightEqualToView(btn)
            .topSpaceToView(btn,5)
            .heightIs(2);
            
        }
        [_view1 sd_addSubviews:@[btn]];
        
        btn.sd_layout
        .leftSpaceToView(_view1,d+(d+100)*i)
        .topSpaceToView(_view1,5)
        .widthIs(100)
        .heightIs(20);
        
    }
    
    
    
}
#pragma mark --顶端3个按钮点击状态
-(void)topClick:(UIButton*)btn{
    _lastBtn.selected=!_lastBtn.selected;
    btn.selected=!btn.selected;
    _lastBtn=btn;
    [_view1 sd_addSubviews:@[_lineView]];
    _lineView.sd_layout
    .leftEqualToView(btn)
    .rightEqualToView(btn)
    .topSpaceToView(btn,5)
    .heightIs(2);
    _AAA=1;
    [_dataArray removeAllObjects];
    [_tableView reloadData];
    if (btn.tag==0) {
        [self shujuDataType:@"001001" Page:_AAA];
    }else if (btn.tag==1){
         [self shujuDataType:@"001002" Page:_AAA];
    }else{
         [self shujuDataType:@"002002" Page:_AAA];
    }
    
    
    
    [_tableView reloadData];
  //  _tableView.tableHeaderView=[self CreatHeadView];
}

#pragma mark --数据解析
-(void)shujuDataType:(NSString*)type Page:(int)page {
    [Engine firstJieKouType:type PageIndex:[NSString stringWithFormat:@"%d",page] success:^(NSDictionary *dic) {
        NSString * item1 =[NSString stringWithFormat:@"%@",[dic objectForKey:@"code"]];
        if ([item1 isEqualToString:@"1"]) {
            NSArray * contentArr =[dic objectForKey:@"content"];
            NSMutableArray * array2 =[NSMutableArray new];
            for (NSDictionary * dicc in contentArr) {
                HomeModel * md =[[HomeModel alloc]initWithDic:dicc];
                [array2 addObject:md];
            }


            if (self.myRefreshView == _tableView.header) {
                _dataArray = array2;
                _tableView.footer.hidden = _dataArray.count==0?YES:NO;
            }else if(self.myRefreshView == _tableView.footer){
                [_dataArray addObjectsFromArray:array2];
            }


            [_tableView reloadData];
            _tableView.tableHeaderView=[self CreatHeadView];
            [_myRefreshView  endRefreshing];

        }else{
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        }

    } error:^(NSError *error) {
        
    }];
}
#pragma mark --创建tableview
-(void)CreatTableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 35, ScreenWidth, ScreenHeight-64-35) style:UITableViewStylePlain];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    //_tableView.tableHeaderView=[self CreatHeadView];
    _tableView.tableFooterView=[UIView new];
    [self.view addSubview:_tableView];
    
    //
        //刷新操作
        __weak typeof (self) weakSelf =self;
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            NSLog(@"往下拉了");
            _AAA=1;
            weakSelf.myRefreshView = weakSelf.tableView.header;
            if (_lastBtn.tag==2) {
                 [self shujuDataType:@"002002" Page:_AAA];
            }else if (_lastBtn.tag==1){
                 [self shujuDataType:@"001002" Page:_AAA];
            }else{
                 [self shujuDataType:@"001001" Page:_AAA];
            }
          
        }];
    
        // 马上进入刷新状态
        [_tableView.header beginRefreshing];
        //..上拉刷新
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            weakSelf.myRefreshView = weakSelf.tableView.footer;
            NSLog(@"往上拉了加载更多");
            _AAA=_AAA+1;
            if (_lastBtn.tag==2) {
                [self shujuDataType:@"002002" Page:_AAA];
            }else if (_lastBtn.tag==1){
                [self shujuDataType:@"001002" Page:_AAA];
            }else{
                [self shujuDataType:@"001001" Page:_AAA];
            }
            
        }];
        _tableView.footer.hidden = YES;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableViewCell * cell =[HomeTableViewCell cellWithTableView:tableView CellID:[NSString stringWithFormat:@"%lu%lu",(long)indexPath.section,(long)indexPath.row]];
//    if (indexPath.row==0) {
//        cell.dianImage.hidden=NO;
//    }
    cell.model=_dataArray[indexPath.row];
    return cell;
    
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
    NSArray * array =@[@"科学要闻",@"工作动态",@"通知公告"];
    //字
    UILabel * nameLabel =[UILabel new];
    nameLabel.text=array[_lastBtn.tag];
    nameLabel.alpha=.7;
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
    //右边箭头
    UIButton * right=[UIButton buttonWithType:UIButtonTypeCustom];
    [right setImage:[UIImage imageNamed:@"tzgg_right"] forState:0];
    [headView sd_addSubviews:@[right]];
    right.sd_layout
    .rightSpaceToView(headView,15)
    .centerYEqualToView(headView)
    .widthIs(20)
    .heightIs(20);
    //线条
//    UIView * lineView2 =[UIView new];
//    lineView2.backgroundColor=COLOR;
//    [headView sd_addSubviews:@[lineView2]];
//    lineView2.sd_layout
//    .leftSpaceToView(headView,0)
//    .rightSpaceToView(headView,0)
//    .topSpaceToView(nameLabel,5)
//    .heightIs(1);

    
    
    return bgView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel * md =_dataArray[indexPath.row];
    XiangQingVC * vc =[XiangQingVC new];
    vc.tagg=1;
    vc.messageID=md.messageID;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --创建表头
-(UIView*)CreatHeadView{
    
    
    
    UIView * view2 =[UIView new];
    view2.backgroundColor=COLOR;
    view2.sd_layout
    .leftSpaceToView(view2,0)
    .rightSpaceToView(view2,0)
    .topSpaceToView(_view1,0)
    .heightIs(225);
    
   
    //NSArray * arr =@[@"dt_banner",@"dt_banner",@"dt_banner"];
   // NSArray * titleArr=@[@"第一张",@"第二张",@"第三张"];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 450/2) delegate:self placeholderImage:[UIImage imageNamed:@"dt_banner"]];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
  //  _cycleScrollView.titlesGroup=titleArr;
    [view2 addSubview:_cycleScrollView];
  
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        _cycleScrollView.imageURLStringsGroup = arr;
//    });
    _cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
        // NSLog(@">>>>>  %ld", (long)index);
        
    };

       if (_dataArray.count==0) {
        return view2;
    }else{
        if (_lastBtn.tag==2){
            return nil;
        }
            NSMutableArray * arrimage =[NSMutableArray new];
            NSMutableArray * titleAr =[NSMutableArray new];
            for (int i =0; i<_dataArray.count; i++) {
                HomeModel * md =_dataArray[i];
                [arrimage addObject:md.urlStr];
                [titleAr addObject:md.titleName];
            }
        
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _cycleScrollView.imageURLStringsGroup = arrimage;
            });
             _cycleScrollView.titlesGroup=titleAr;
        
        _cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
            HomeModel * md=_dataArray[index];
            XiangQingVC * vc =[XiangQingVC new];
            vc.tagg=1;
            vc.messageID=md.messageID;
            [self.navigationController pushViewController:vc animated:YES];
            
        };
        
    }

    
    
    
 /** 每张图片对应要显示的文字数组
    @property (nonatomic, strong) NSArray *titlesGroup;
    
    * 轮播文字label字体颜色 
    @property (nonatomic, strong) UIColor *titleLabelTextColor;
    
    * 轮播文字label字体大小 
    @property (nonatomic, strong) UIFont  *titleLabelTextFont;
    
    * 轮播文字label背景颜色 
    @property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
    
    * 轮播文字label高度 
    @property (nonatomic, assign) CGFloat titleLabelHeight;
 
 
 
 **/
    if (_lastBtn.tag==2) {
        return nil;
    }else{
        return view2;
  
    }
    
}


@end
