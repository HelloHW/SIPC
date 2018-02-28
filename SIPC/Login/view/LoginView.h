//
//  LoginView.h
//  有源设备
//
//  Created by ELI on 17/7/28.
//  Copyright © 2017年 Stag. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate

-(void)changeIP;

@end

@interface LoginView : UIView<UITextFieldDelegate>

@property(nonatomic,strong)UITextField * userNameTF;       //用户名输入框
@property(nonatomic,strong)UITextField * passWordTF;       //密码输入框
@property(nonatomic,strong)UITextField * IPTF;             //IP显示框

@property(nonatomic,strong)UIButton * forgetBut;            //忘记密码
@property(nonatomic,strong)UIButton * eyeBut;               //显示密码按钮
@property(nonatomic,strong)UIButton * registerBut;          //注册按钮
@property(nonatomic,strong)UIButton * loginBut;             //登录按钮

@property(nonatomic,strong)UILabel * lineLabel;             //补充下划线

@property(nonatomic,weak) id<LoginDelegate>delegate;

-(void)initView;//初始化控件

@end
