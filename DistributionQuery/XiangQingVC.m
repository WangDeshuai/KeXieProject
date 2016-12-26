//
//  XiangQingVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/26.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "XiangQingVC.h"
#import "HomeModel.h"
@interface XiangQingVC ()

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
    
    [self CreatView];
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
    //title
    UILabel * nameLabel =[UILabel new];
    nameLabel.text=@"科技创新与企业发展专家论坛";
    nameLabel.numberOfLines=0;
    nameLabel.font=[UIFont systemFontOfSize:19];
    [view1 sd_addSubviews:@[nameLabel]];
    nameLabel.sd_layout
    .leftSpaceToView(view1,15)
    .rightSpaceToView(view1,15)
    .topSpaceToView(view1,20)
    .autoHeightRatio(0);
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
            contentLabel.text=md.contentName;
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
        [Engine  appShenHeWenZhangMessageID:_messageID ShenHeStype:@"-1" success:^(NSDictionary *dic) {
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        } error:^(NSError *error) {
            
        }];
        
    }else{
        //通过
        UIAlertController * actionView =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否确认审核通过" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 =[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [Engine  appShenHeWenZhangMessageID:_messageID ShenHeStype:@"1" success:^(NSDictionary *dic) {
                [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
            } error:^(NSError *error) {
                
            }];
        }];
        UIAlertAction * action2 =[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [actionView addAction:action2];
        [actionView addAction:action1];
        [self presentViewController:actionView animated:YES completion:nil];
//
        
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
