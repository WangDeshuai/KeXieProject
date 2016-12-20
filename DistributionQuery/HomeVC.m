//
//  HomeVC.m
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "HomeVC.h"
#import "HomeTableViewCell.h"
@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic,strong)UIView * view1;
@property(nonatomic,strong)UIButton * lastBtn;
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;
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
    self.navigationItem.rightBarButtonItems=@[rightBtn2];
}
#pragma mark --dia
-(void)leftButton{
    [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController showLeftController:YES];
    
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
    [_tableView reloadData];
    _tableView.tableHeaderView=[self CreatHeadView];
}


#pragma mark --创建tableview
-(void)CreatTableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 35, ScreenWidth, ScreenHeight-64-35) style:UITableViewStylePlain];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableHeaderView=[self CreatHeadView];
    _tableView.tableFooterView=[UIView new];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableViewCell * cell =[HomeTableViewCell cellWithTableView:tableView CellID:[NSString stringWithFormat:@"%lu%lu",indexPath.section,indexPath.row]];
    if (indexPath.row==0) {
        cell.dianImage.hidden=NO;
    }
    
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
    .heightIs(30);
    
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
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 42;
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
    
    
    NSArray * arr =@[@"dt_banner",@"dt_banner",@"dt_banner"];
    NSArray * titleArr=@[@"第一张",@"第二张",@"第三张"];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 450/2) delegate:self placeholderImage:[UIImage imageNamed:@"dt_banner"]];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    _cycleScrollView.titlesGroup=titleArr;
    [view2 addSubview:_cycleScrollView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _cycleScrollView.imageURLStringsGroup = arr;
    });
    _cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
        // NSLog(@">>>>>  %ld", (long)index);
        
    };

 
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
