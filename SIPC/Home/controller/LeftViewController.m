//
//  LeftViewController.m
//  SIPC
//
//  Created by ELI.钟华威 on 2018/2/9.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftTableViewCell.h"
#import "CollectionCellModel.h"
#import "UIViewController+CWLateralSlide.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * letfTabelView;
    NSMutableArray * TabelViewDataArr;
}
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * headBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth*0.75, 180)];
    //设置渐变颜色
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = headBackView.bounds;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [headBackView.layer addSublayer:gradientLayer];
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor redColor].CGColor];
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.5f), @(1.0f)];
    [self.view addSubview:headBackView];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(50, 40, 80, 80)];
    [img setImage:[UIImage imageNamed:@"个人中心"]];
    
    // 添加触摸事件
    img.userInteractionEnabled = YES;
    [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapAction)]];
    [headBackView addSubview:img];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(img.frame), 180, 50)];
    NSString * plistPath = @"";
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    nameLabel.text =[NSString stringWithFormat:@"%@\n%@",dic[@"displayName"],dic[@"phone"]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel setNumberOfLines:0];
    [headBackView addSubview:nameLabel];
    
    TabelViewDataArr = [NSMutableArray array];
    NSArray * tabelTitleArr = [NSArray arrayWithObjects:@"个人信息", @"版本:1.0.3.0", @"注销",nil];
    NSArray * tabelImageArr = [NSArray arrayWithObjects:@"person", @"version", @"注销",  nil];
    for (int i = 0; i < tabelTitleArr.count; i++) {
        CollectionCellModel *model = [CollectionCellModel createNewCellModel:tabelTitleArr[i] imageUrl:tabelImageArr[i]];
        [TabelViewDataArr addObject:model];
    }
    letfTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headBackView.frame), kScreenWidth*0.75  , kScreenHeight-180)];
    letfTabelView.delegate = self;
    letfTabelView.dataSource = self;
    letfTabelView.rowHeight = 44;
    [letfTabelView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:letfTabelView];
    
}
#pragma mark - tabelView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return TabelViewDataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    CollectionCellModel * model = TabelViewDataArr[indexPath.row];
    [cell reloadDataWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            
        }
            break;
        case 1:{
            
        }
            break;
        case 2:{
           
        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
