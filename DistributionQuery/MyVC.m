//
//  MyVC.m
//  DistributionQuery
//
//  Created by Macx on 16/10/8.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "MyVC.h"

@interface MyVC ()
@property(nonatomic,strong)UITextField * titleText;
@property(nonatomic,strong)UITextView * titleTextView;
@property(nonatomic,strong)UITextField * nameText;
@property(nonatomic,strong)UITextField * phoneText;
@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=COLOR;
    self.title=@"意见建议";
    [self CreatLabel1];
}
-(void)CreatLabel1{
    //温馨提示
    UILabel * nameLabel =[UILabel new];
    nameLabel.backgroundColor=COLOR;
    nameLabel.text=@"温馨提示\n请您放心填写个人信息，全部信息都会保密";
    nameLabel.alpha=.7;
    nameLabel.font=[UIFont systemFontOfSize:16];
    nameLabel.textAlignment=1;
    nameLabel.numberOfLines=0;
    [self.view sd_addSubviews:@[nameLabel]];
    nameLabel.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,5)
    .heightIs(50);
    //view1
    UIView * view1 =[UIView new];
    view1.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[view1]];
    view1.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(nameLabel,10)
    .heightIs(100);
    //标题
    UILabel * titleLabel =[UILabel new];
    titleLabel.text=@"标     题";
    titleLabel.alpha=.9;
    titleLabel.font=[UIFont systemFontOfSize:15];
    titleLabel.textAlignment=1;
    [view1 sd_addSubviews:@[titleLabel]];
    titleLabel.sd_layout
    .leftSpaceToView(view1,15)
    .topSpaceToView(view1,10)
    .heightIs(50);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    //文本框
    _titleText=[UITextField new];
    _titleText.placeholder=@"一句话简要写下您的标题吧";
    _titleText.font=[UIFont systemFontOfSize:15];
    [view1 sd_addSubviews:@[_titleText]];
    _titleText.sd_layout
    .leftSpaceToView(titleLabel,10)
    .rightSpaceToView(view1,15)
    .centerYEqualToView(titleLabel)
    .heightIs(30);
    
    //线条
    UIView * lineView =[UIView new];
    lineView.backgroundColor=COLOR;
    [view1 sd_addSubviews:@[lineView]];
    lineView.sd_layout
    .leftSpaceToView(view1,0)
    .rightSpaceToView(view1,0)
    .topSpaceToView(titleLabel,10)
    .heightIs(1);
   
    //textfield
    _titleTextView =[UITextView new];
    _titleTextView.text=@"请您详细填写您的建议意见,方便我们及时更正";
    _titleTextView.font=[UIFont systemFontOfSize:16];
    _titleTextView.textColor=[UIColor grayColor];
    [view1 sd_addSubviews:@[_titleTextView]];
    _titleTextView.sd_layout
    .topSpaceToView(lineView,15)
    .leftEqualToView(titleLabel)
    .rightEqualToView(_titleText)
    .heightIs(100);
    [view1 setupAutoHeightWithBottomView:_titleTextView bottomMargin:10];

    //view2

    UIView * view2 =[UIView new];
    view2.backgroundColor=[UIColor whiteColor];
    [self.view sd_addSubviews:@[view2]];
    view2.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(view1,10)
    .heightIs(100);

    //姓名
    UILabel * xingName =[UILabel new];
    xingName.text=@"姓     名";
    xingName.alpha=.9;
    xingName.font=[UIFont systemFontOfSize:15];
    xingName.textAlignment=1;
    [view2 sd_addSubviews:@[xingName]];
    xingName.sd_layout
    .leftSpaceToView(view2,15)
    .topSpaceToView(view2,5)
    .heightIs(50);
    [xingName setSingleLineAutoResizeWithMaxWidth:200];
    
    //文本框
    _nameText=[UITextField new];
    _nameText.placeholder=@"请准确填写";
    _nameText.font=[UIFont systemFontOfSize:15];
    [view2 sd_addSubviews:@[_nameText]];
    _nameText.sd_layout
    .leftSpaceToView(xingName,10)
    .rightSpaceToView(view2,15)
    .centerYEqualToView(xingName)
    .heightIs(30);

    //线条2
    UIView * lineView2 =[UIView new];
    lineView2.backgroundColor=COLOR;
    [view2 sd_addSubviews:@[lineView2]];
    lineView2.sd_layout
    .leftSpaceToView(view2,0)
    .rightSpaceToView(view2,0)
    .topSpaceToView(xingName,10)
    .heightIs(1);
    
    
    //手机号
    UILabel * phoneLabel =[UILabel new];
    phoneLabel.text=@"手 机 号";
    phoneLabel.alpha=.9;
    phoneLabel.font=[UIFont systemFontOfSize:15];
    phoneLabel.textAlignment=1;
    [view2 sd_addSubviews:@[phoneLabel]];
    phoneLabel.sd_layout
    .leftSpaceToView(view2,15)
    .topSpaceToView(lineView2,10)
    .heightIs(50);
    [phoneLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    //文本框
    _phoneText=[UITextField new];
    _phoneText.placeholder=@"请准确填写";
    _phoneText.keyboardType=UIKeyboardTypePhonePad;
    _phoneText.font=[UIFont systemFontOfSize:15];
    [view2 sd_addSubviews:@[_phoneText]];
    _phoneText.sd_layout
    .leftSpaceToView(phoneLabel,10)
    .rightSpaceToView(view2,15)
    .centerYEqualToView(phoneLabel)
    .heightIs(30);

    [view2 setupAutoHeightWithBottomView:_phoneText bottomMargin:10];
    
//提交按钮
    UIButton * tijiaobtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [tijiaobtn setBackgroundImage:[UIImage imageNamed:@"yj_bt"] forState:0];
    [tijiaobtn addTarget:self action:@selector(tijiaoBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view sd_addSubviews:@[tijiaobtn]];
    tijiaobtn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(view2,40)
    .widthIs(560/2)
    .heightIs(45);
    
}
#pragma mark --提交
-(void)tijiaoBtn{
   /*
    titleText;
    titleTextView
    nameText
    phoneText
    */
    [LCProgressHUD showLoading:@"提交中..."];
    [Engine tijiaoMessageUserID:[NSUSE_DEFO objectForKey:@"token"] Title:_titleText.text Content:_titleTextView.text UserName:_nameText.text PhoneNumber:_phoneText.text success:^(NSDictionary *dic) {
        NSString * item1 =[NSString stringWithFormat:@"%@",[dic objectForKey:@"code"]];
        if ([item1 isEqualToString:@"1"]) {
             [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
            [self backHomeFirst];
        }else{
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        }
    } error:^(NSError *error) {
        
    }];
    
    
}
-(void)backHomeFirst{
    HomeVC * vc =[HomeVC new];
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
