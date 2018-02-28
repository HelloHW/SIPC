//
//  AppDelegate.h
//  SIPC
//
//  Created by ELI.钟华威 on 2018/1/17.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
// 尺寸
#define kScreenSize   [[UIScreen mainScreen] bounds].size
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController * rootViewController;



/** 屏幕中间添加提示语*/
- (void)makeToastTitle:(NSString *)toastTitle;

/**
 根据标题字符串大小自适应

 @param content 标题
 @param font 字体大小
 @param size 原size
 @return 返回size
 */
-(CGSize) boundingRectWithContent:(NSString*) content Font:(UIFont*) font Size:(CGSize) size;

/** 将相应数据转成数组*/
- (NSArray *)conversionData:(id)responseObject;
/** 将相应数据转成字典*/
- (NSDictionary *)conversionDataForDictionary:(id)responseObject;
/**
 判断对象是否为null
 
 @param object 对象
 @return 返回布尔值
 */
-(BOOL)isNull:(id)object;

/**
 判断对象字典中是否为空
 */
- (NSString*)dealNullStr:(NSString*)interString;
/**
 拼接字符串
 */
- (NSString *)appendString:(NSString *)titleString contentString:(NSString *)contentString;
/**
 NSDate转String
 */
- (NSString *)dateTypeConverToStringType:(NSDate *)date;
@end

