//
//  LoginVC.m
//  DistributionQuery
//
//  Created by Macx on 16/12/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (nonatomic,strong)UILabel * logoName;
@property(nonatomic,strong)UITextField * phoneText;
@property(nonatomic,strong)UITextField * pwdText;
@property(nonatomic,strong)UIImageView * bgImageview;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _bgImageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_bg"]];
    _bgImageview.userInteractionEnabled=YES;
    _bgImageview.frame=self.view.bounds;
    [self.view addSubview:_bgImageview];

    //返回按钮
   UIButton* _backHomeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_backHomeBtn setImage:[UIImage imageNamed:@"back"] forState:0];
    _backHomeBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    [_backHomeBtn addTarget:self action:@selector(backPopBtnPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view sd_addSubviews:@[_backHomeBtn]];
    _backHomeBtn.sd_layout
    .leftSpaceToView(self.view,15)
    .topSpaceToView(self.view,30)
    .widthIs(70)
    .heightIs(30);
    
    [self CeratLogo];
}
#pragma mark --返回按钮
-(void)backPopBtnPop{
    HomeVC * vc =[HomeVC new];
    BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController setRootController:navController animated:YES];
}

-(void)CeratLogo{
    UIImageView * logoImage =[[UIImageView alloc]init];
    logoImage.image=[UIImage imageNamed:@"login_logo"];
    [self.view sd_addSubviews:@[logoImage]];
    logoImage.sd_layout
    .topSpaceToView(self.view,100)
    .centerXEqualToView(self.view)
    .widthIs(182/2)
    .heightIs(182/2);

    _logoName=[UILabel new];
    _logoName.text=@"河北省科学技术协会";
    _logoName.textColor=[UIColor whiteColor];
    _logoName.font=[UIFont systemFontOfSize:16];
    [self.view sd_addSubviews:@[_logoName]];
    _logoName.sd_layout
    .centerXEqualToView(logoImage)
    .topSpaceToView(logoImage,15)
    .heightIs(20);
    [_logoName setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
//手机号
    _phoneText=[UITextField new];
    _phoneText.placeholder=@"请输入手机号";
    _phoneText.textColor=[UIColor whiteColor];
    _phoneText.font=[UIFont systemFontOfSize:15];
//    _phoneText.keyboardType=UIKeyboardTypePhonePad;
    _phoneText.leftView =[self imageViewNameStr:@"login_gl"];
    _phoneText.leftViewMode = UITextFieldViewModeAlways;
    [self.view sd_addSubviews:@[_phoneText]];
    _phoneText.sd_layout
    .centerXEqualToView(self.view)
    .heightIs(35)
    .widthIs(ScreenWidth-60)
    .topSpaceToView(_logoName,50);
    //线条1
    UIView * lineView1 =[UIView new];
    lineView1.backgroundColor=COLOR;
    [self.view sd_addSubviews:@[lineView1]];
    lineView1.sd_layout
    .leftEqualToView(_phoneText)
    .rightEqualToView(_phoneText)
    .topSpaceToView(_phoneText,2)
    .heightIs(1);
    
   [_phoneText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_phoneText setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    
    
//密码
    _pwdText=[UITextField new];
    _pwdText.placeholder=@"请输入密码";
//    _pwdText.keyboardType=UIKeyboardTypePhonePad;
    _pwdText.textColor=[UIColor whiteColor];
    _pwdText.font=[UIFont systemFontOfSize:15];
    _pwdText.leftView =[self imageViewNameStr:@"login_ys"];
    _pwdText.leftViewMode = UITextFieldViewModeAlways;
    [self.view sd_addSubviews:@[_pwdText]];
    _pwdText.sd_layout
    .centerXEqualToView(_phoneText)
    .heightIs(35)
    .widthIs(ScreenWidth-60)
    .topSpaceToView(_phoneText,30);

    //线条2
    UIView * lineView2 =[UIView new];
    lineView2.backgroundColor=COLOR;
    [self.view sd_addSubviews:@[lineView2]];
    lineView2.sd_layout
    .leftEqualToView(_pwdText)
    .rightEqualToView(_pwdText)
    .topSpaceToView(_pwdText,2)
    .heightIs(1);
    
    [_pwdText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_pwdText setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    

//登录按钮
    UIButton * loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_bt"] forState:0];
    [loginBtn addTarget:self action:@selector(logintClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view sd_addSubviews:@[loginBtn]];
    loginBtn.sd_layout
    .topSpaceToView(lineView2,40)
    .widthIs(665/2)
    .heightIs(50)
    .centerXEqualToView(self.view);
}

-(void)logintClick{
    [LCProgressHUD showLoading:@"登录中..."];
    [Engine  usetLoginAccount:_phoneText.text Password:_pwdText.text success:^(NSDictionary *dic) {
        NSString * item1 =[NSString stringWithFormat:@"%@",[dic objectForKey:@"code"]];
        if ([item1 isEqualToString:@"1"]) {
            NSDictionary * content =[dic objectForKey:@"content"];
            NSDictionary *userInfo =[content objectForKey:@"userInfo"];
            //把ID 存为token
            [NSUSE_DEFO setObject:[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"id"]] forKey:@"token"];
            //用户名存上
             [NSUSE_DEFO setObject:[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"account"]] forKey:@"account"];
            [NSUSE_DEFO synchronize];
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
            [self backPopBtnPop];//返回首页
        }else{
            [LCProgressHUD showMessage:[dic objectForKey:@"msg"]];
        }
    } error:^(NSError *error) {
        
    }];
    

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
    [_bgImageview endEditing:YES];
}
-(UIButton*)imageViewNameStr:(NSString*)imageName{
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:0];
    
    btn.frame=CGRectMake(0, 0, 30, 30);
    return btn;
}
@end
