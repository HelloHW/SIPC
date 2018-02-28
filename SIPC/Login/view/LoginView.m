//
//  LoginView.m
//  有源设备
//
//  Created by ELI on 17/7/28.
//  Copyright © 2017年 Stag. All rights reserved.
//

#import "LoginView.h"
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
@implementation LoginView

-(void)initView{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    bgImageView.userInteractionEnabled = YES;
    bgImageView.image = [UIImage imageNamed:@"login_bg.jpg"];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, (kScreenHeight-250)/2+50, 70, 30)];
    nameLabel.text = @"用户名：";
    _userNameTF = [[UITextField alloc]init];
    _userNameTF.frame = CGRectMake(120, (kScreenHeight-250)/2 + 50, self.frame.size.width-170, 30);
    _userNameTF.placeholder = @"请输入用户名";
    
    UILabel * paswLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, _userNameTF.frame.origin.y+40, 70, 30)];
    paswLabel.text = @"密    码：";

    _passWordTF = [[UITextField alloc]init];
    _passWordTF.frame = CGRectMake(120, _userNameTF.frame.origin.y+40, self.frame.size.width-210, 30);//170
    _passWordTF.secureTextEntry = YES;
    _passWordTF.placeholder = @"请输入密码";
    //清空按钮
    _userNameTF.clearButtonMode = UITextFieldViewModeAlways;
    _passWordTF.clearButtonMode = UITextFieldViewModeAlways;
    
    
    _userNameTF.delegate = self;
    _passWordTF.delegate = self;
    
    _eyeBut = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-90, _userNameTF.frame.origin.y+40, 40, 30)];
    _eyeBut.selected = NO;
    
    [_eyeBut setBackgroundImage:[UIImage imageNamed:@"key_hide"] forState:UIControlStateNormal];
    [_eyeBut setBackgroundImage:[UIImage imageNamed:@"key_show"] forState:UIControlStateSelected];
   
    _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-90, _userNameTF.frame.origin.y+69, 40, 1)];
    _lineLabel.layer.borderWidth = 0.5;
    _lineLabel.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    _lineLabel.hidden = YES;
    _eyeBut.hidden = YES;
    
    _loginBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBut setFrame:CGRectMake(50, _passWordTF.frame.origin.y+50, self.frame.size.width-100, 40)];
    [_loginBut setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBut setBackgroundColor:[UIColor colorWithRed:0.4745 green:0.7529 blue:0.9608 alpha:1]];
    _loginBut.layer.cornerRadius = 5.0;
    
    _forgetBut = [[UIButton alloc]initWithFrame:CGRectMake(50, _loginBut.frame.origin.y+60, 100, 30)];
    [_forgetBut setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetBut setTitleColor:[UIColor colorWithRed:0.4745 green:0.7529 blue:0.9608 alpha:1] forState:UIControlStateNormal];
     _forgetBut.contentHorizontalAlignment = UITextLayoutDirectionLeft;

    _registerBut = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-150, _loginBut.frame.origin.y+60, 100, 30)];
    [_registerBut setTitle:@"新用户注册" forState:UIControlStateNormal];
    [_registerBut setTitleColor:[UIColor colorWithRed:0.4745 green:0.7529 blue:0.9608 alpha:1] forState:UIControlStateNormal];
//    _registerBut.contentHorizontalAlignment = UITextLayoutDirectionRight;
    
    
    UILabel * _IPLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _registerBut.frame.origin.y+60, 70, 40)];
    _IPLabel.textAlignment = NSTextAlignmentCenter;
    _IPLabel.numberOfLines = 0;
    _IPLabel.text = @"IP地址:";
    
    _IPTF = [[UITextField alloc]initWithFrame:CGRectMake(100, _registerBut.frame.origin.y+60, self.frame.size.width-130, 40)];
    _IPTF.textColor = [UIColor lightGrayColor];
    _IPTF.delegate = self;
    _IPTF.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:bgImageView];
    
    [bgImageView addSubview:nameLabel];        //用户名提示
    [bgImageView addSubview:paswLabel];        //密码提示
    [bgImageView addSubview:_userNameTF];      //用户名输入框
    [bgImageView addSubview:_passWordTF];      //密码输入框
    [bgImageView addSubview:_eyeBut];          //隐藏显示密码按钮
    
    [bgImageView addSubview:_lineLabel];
    
    [bgImageView addSubview:_loginBut];        //登录按钮
    [bgImageView addSubview:_forgetBut];       //忘记密码按钮
    [bgImageView addSubview:_registerBut];     //注册按钮
    [bgImageView addSubview:_IPLabel];         //IP地址提示
    [bgImageView addSubview:_IPTF];            //IP地址TF
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([textField isEqual:_IPTF]) {
        [_delegate changeIP];
        return NO;
    }
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:_passWordTF]&&_passWordTF.text.length>0) {
        NSLog(@"length test");
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:_passWordTF]&&_passWordTF.text.length>0) {
        NSLog(@"length test");
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField isEqual:_passWordTF]) {
        if (textField.text.length==0&&string.length>=1) {
            //显示
            CGRect PWrect       = _passWordTF.frame;
            PWrect.size.width   = self.frame.size.width-210;
            _passWordTF.frame   = PWrect;
            _lineLabel.hidden   = NO;
            _eyeBut.hidden      = NO;
        }
        if (textField.text.length==1&&string.length==0) {
            //隐藏
            CGRect PWrect       = _passWordTF.frame;
            PWrect.size.width   = self.frame.size.width-170;
            _passWordTF.frame   = PWrect;
            _lineLabel.hidden   = YES;
            _eyeBut.hidden      = YES;
        }
    }
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    if ([textField isEqual:_passWordTF  ]) {
        CGRect PWrect       = _passWordTF.frame;
        PWrect.size.width   = self.frame.size.width-170;
        _passWordTF.frame   = PWrect;
        _lineLabel.hidden   = YES;
        _eyeBut.hidden      = YES;
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
