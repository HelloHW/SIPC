//
//  ViewController.m
//  SIPC
//
//  Created by ELI.钟华威 on 2018/1/17.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"


@interface ViewController ()<LoginDelegate>
{
    LoginView * loginView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [loginView initView];
    
    
    //添加登录按钮点击事件
    [loginView.loginBut addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    //添加记住密码按钮点击事件
    [loginView.forgetBut addTarget:self action:@selector(forget:) forControlEvents:UIControlEventTouchUpInside];
    //添加设置按钮点击事件
    [loginView.eyeBut addTarget:self action:@selector(eye:) forControlEvents:UIControlEventTouchUpInside];
    //添加注册用户按钮点击事件
    [loginView.registerBut addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    loginView.delegate = self;
    [self.view addSubview:loginView];
}

-(void)login{
    HomeViewController * next = [[HomeViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:next];
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    app.window.rootViewController = nav;
    [self presentViewController:nav animated:YES completion:nil];
    
}



-(void)eye:(UIButton*)button{
    
}

-(void)forget:(UIButton*)but{
    
}

-(void)regist{
   
}

-(void)changeIP{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
