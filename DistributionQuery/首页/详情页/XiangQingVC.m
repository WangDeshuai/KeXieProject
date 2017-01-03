//
//  XiangQingVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "XiangQingVC.h"
#import "HomeModel.h"
#import "LrdOutputView.h"
@interface XiangQingVC ()<LrdOutputViewDelegate>
@property (nonatomic, strong) LrdOutputView *outputView;//下拉菜单
@property(nonatomic,strong)NSArray * menuArr;
@property(nonatomic,strong)UIButton * btnImage;
@property(nonatomic,assign)NSInteger  indexPage;
@end

@implementation XiangQingVC

-(void)viewWillAppear:(BOOL)animated{
    [NSUSE_DEFO setObject:@"back" forKey:@"返回"];
    [NSUSE_DEFO synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"公告详情";
    self.view.backgroundColor=COLOR;
    if (_tagg==2) {
        //右按钮
        UIButton * rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame=CGRectMake(0, 0, 70, 40);
        [rightBtn setTitle:@"审核方式" forState:0];
        rightBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        UIBarButtonItem * rightBtn2 =[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
        [rightBtn addTarget:self action:@selector(sheZhiBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItems=@[rightBtn2];
        //下拉菜单
        LrdCellModel *one = [[LrdCellModel alloc] initWithTitle:@"初审" imageName:@"11"];
        LrdCellModel *two = [[LrdCellModel alloc] initWithTitle:@"终审" imageName:@"11"];
        self.menuArr = @[one, two];
    }
    [self CreatView];
}
#pragma mark --右按钮设置
-(void)sheZhiBtn:(UIButton*)btn{
    CGFloat x = btn.center.x+20;
    CGFloat y = btn.frame.origin.y + btn.bounds.size.height + 25;
    _outputView = [[LrdOutputView alloc] initWithDataArray:self.menuArr origin:CGPointMake(x, y) width:90 height:40 direction:kLrdOutputViewDirectionRight];
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
    _indexPage=indexPath.row;
    if (indexPath.row==0) {
        //关于我们
          [_btnImage setImage:[UIImage imageNamed:@"chushen"] forState:0];
    }else{
        //退出
          [_btnImage setImage:[UIImage imageNamed:@"zhongsheng"] forState:0];
    }
    
}



-(void)CreatView{
    UIView * view1 =[UIView new];
    view1.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[view1]];
    view1.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,10)
    .heightIs(150);
    if (_tagg==2) {
        _btnImage=[UIButton buttonWithType:UIButtonTypeCustom];
        [_btnImage setImage:[UIImage imageNamed:@"chushen"] forState:0];
        [view1 sd_addSubviews:@[_btnImage]];//56  62
        _btnImage.sd_layout
        .leftSpaceToView(view1,10)
        .topSpaceToView(view1,0)
        .widthIs(56/2)
        .heightIs(62/2);
    }
   
    //title
    UILabel * nameLabel =[UILabel new];
    nameLabel.text=@"科技创新与企业发展专家论坛";
    nameLabel.numberOfLines=0;
    nameLabel.font=[UIFont systemFontOfSize:19];
    [view1 sd_addSubviews:@[nameLabel]];
    if (_tagg==2) {
        nameLabel.sd_layout
        .leftSpaceToView(view1,15)
        .rightSpaceToView(view1,15)
        .topSpaceToView(_btnImage,10)
        .autoHeightRatio(0);
    }else{
        nameLabel.sd_layout
        .leftSpaceToView(view1,15)
        .rightSpaceToView(view1,15)
        .topSpaceToView(view1,20)
        .autoHeightRatio(0);
    }
    
    //time
    UILabel * timeLabel =[UILabel new];
    timeLabel.backgroundColor=COLOR;
    timeLabel.text=@"2016-11-20";
    timeLabel.alpha=.5;
    timeLabel.font=[UIFont systemFontOfSize:15];
    [view1 sd_addSubviews:@[timeLabel]];
    timeLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(nameLabel,20)
    .heightIs(20);
    [timeLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
    [view1 setupAutoHeightWithBottomView:timeLabel bottomMargin:10];
    
    
    // 创建view2
    UIView * view2 =[UIView new];
    view2.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[view2]];
    if (_tagg==1) {
        view2.sd_layout
        .leftSpaceToView(self.view,0)
        .rightSpaceToView(self.view,0)
        .topSpaceToView(view1,10)
        .bottomSpaceToView(self.view,0);
 
    }else{
        view2.sd_layout
        .leftSpaceToView(self.view,0)
        .rightSpaceToView(self.view,0)
        .topSpaceToView(view1,10)
        .bottomSpaceToView(self.view,60);

    }
    
    UITextView * contentLabel =[UITextView new];
  //  contentLabel.backgroundColor=[UIColor redColor];
    contentLabel.text=@"萨拉垃圾发电看了GV克里斯GV卡拉卡打卡看吧的vavasaafa萨拉垃圾发电看了GV克里斯GV卡拉卡打卡看吧的vavasaafa萨拉垃圾发电看了GV克里斯GV卡拉卡打卡看吧的vavasaafa";
    contentLabel.alpha=.6;
    contentLabel.editable=NO;
    contentLabel.font=[UIFont systemFontOfSize:15];
    [view2 sd_addSubviews:@[contentLabel]];
    contentLabel.sd_layout
    .leftEqualToView(nameLabel)
    .rightSpaceToView(view2,15)
    .topSpaceToView(view2,20)
    .bottomSpaceToView(view2,10);

    [Engine chaXunXiangQingMessageID:_messageID success:^(NSDictionary *dic) {
        NSString * item1 =[NSString stringWithFormat:@"%@",[dic objectForKey:@"code"]];
        if ([item1 isEqualToString:@"1"]) {
            NSDictionary * dicc =[dic objectForKey:@"content"];
            HomeModel * md =[[HomeModel alloc]initWithXiangQingDic:dicc];
            nameLabel.text=md.titleName;
            timeLabel.text=md.timeName;
            contentLabel.attributedText=[ToolClass HTML:md.contentName];
        }else{
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        }
    } error:^(NSError *error) {
        
    }];
    
    
    
    UIView * view3 =[UIView new];
    view3.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[view3]];
    view3.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(view2,10)
    .bottomSpaceToView(self.view,0);
    
    if (_tagg==2) {
        NSArray * arr =@[@"bt11",@"bt1"];
        int d =(ScreenWidth-246)/3;
        for (int i =0; i<arr.count; i++) {
            UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.tag=i;
            [button setImage:[UIImage imageNamed:arr[i]] forState:0];
            [button addTarget:self action:@selector(buttonClinck:) forControlEvents:UIControlEventTouchUpInside];
            [view3 sd_addSubviews:@[button]];
            button.sd_layout
            .leftSpaceToView(view3,d+(d+246/2)*i)
            .centerYEqualToView(view3)
            .widthIs(246/2)
            .heightIs(71/2);
        }
        
  
    }
    
    
}
-(void)buttonClinck:(UIButton*)btn{
    if (btn.tag==0) {
        //不通过
        [Engine  appShenHeWenZhangMessageID:_messageID ShenHeStype:@"-1" audit_type:[NSString stringWithFormat:@"%ld",(long)_indexPage+1] success:^(NSDictionary *dic) {
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        } error:^(NSError *error) {
            
        }];
        
    }else{
        //通过
        UIAlertController * actionView =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否确认审核通过" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 =[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //1初审，2终审
            [Engine  appShenHeWenZhangMessageID:_messageID ShenHeStype:@"1" audit_type:[NSString stringWithFormat:@"%ld",(long)_indexPage+1] success:^(NSDictionary *dic) {
                [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
            } error:^(NSError *error) {
                
            }];
        }];
        UIAlertAction * action2 =[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [actionView addAction:action2];
        [actionView addAction:action1];
        [self presentViewController:actionView animated:YES completion:nil];

    }
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
