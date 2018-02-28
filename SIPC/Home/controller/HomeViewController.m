//
//  HomeViewController.m
//  ABMS
//
//  Created by ELI.钟华威 on 2018/1/5.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import "HomeViewController.h"

//侧滑
#import "LeftViewController.h"
#import "UIViewController+CWLateralSlide.h"

@interface HomeViewController ()


@end


@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
   
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(-20, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"LeftList.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    //TODO:侧滑初始化
    // 注册手势驱动
//    __weak typeof(self)weakSelf = self;
//    // 第一个参数为是否开启边缘手势，开启则默认从边缘50距离内有效，第二个block为手势过程中我们希望做的操作
//    [self cw_registerShowIntractiveWithEdgeGesture:NO transitionDirectionAutoBlock:^(CWDrawerTransitionDirection direction) {
//        //NSLog(@"direction = %ld", direction);
//        if (direction == CWDrawerTransitionDirectionLeft) { // 左侧滑出
//            [weakSelf leftClick];
//        } else if (direction == CWDrawerTransitionDirectionRight) { // 右侧滑出
//            //            [weakSelf rightClick];
//        }
//    }];
}



#pragma mark - 侧滑

-(void)leftClick{
    LeftViewController * vc = [[LeftViewController alloc]init];
    [self cw_showDefaultDrawerViewController:vc];
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

