//
//  AppDelegate.m
//  SIPC
//
//  Created by ELI.钟华威 on 2018/1/17.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import "AppDelegate.h"
//高德地图
#import <AMapNaviKit/AMapNaviKit.h>
//#import <AMapNaviKit/MAMapKit.h>
//#define JPUSH_KEY @"2c59ea5fc3ff93fe1a34b138"
#define MAMAP_KEY @"a8541574f98a29c3b095601b145890cf"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    _rootViewController = [[ViewController alloc]init];
    self.window.rootViewController = _rootViewController;
    [self initAMap];
    return YES;
    
}
#pragma mark - 高德地图
- (void)initAMap{
    [AMapServices sharedServices].apiKey = MAMAP_KEY;
//    [MAMapServices sharedServices].apiKey = MAMAP_KEY;
//    [AMapNaviServices sharedServices].apiKey = MAMAP_KEY;
}
#pragma mark ----全局变量----





-(CGSize) boundingRectWithContent:(NSString*) content Font:(UIFont*) font Size:(CGSize) size{
    CGSize buttonSize = [content boundingRectWithSize:size
                                              options:NSStringDrawingTruncatesLastVisibleLine  | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName:font}
                                              context:nil].size;
    
    return buttonSize;
}
#pragma mark ----从平台获取到的responsed转换成字典和数组的方法
- (NSArray *)conversionData:(id)responseObject {
    NSData * data2 = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error;
    NSArray * arr2 = [NSJSONSerialization JSONObjectWithData:data2
                                                     options:NSJSONReadingMutableContainers
                                                       error:&error];
    return arr2;
}

- (NSDictionary *)conversionDataForDictionary:(id)responseObject {
    NSData * data = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
}

-(BOOL)isNull:(id)object{
    if ([object isEqual:[NSNull null]])  return YES;
    else if ([object isKindOfClass:[NSNull class]]) return YES;
    else if (object==nil) return YES;
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(NSString*)dealNullStr:(NSString*)interString{
    return [self isNull:interString]?@"":interString;
}

- (NSString *)appendString:(NSString *)titleString contentString:(NSString *)contentString {
    return [NSString stringWithFormat:@"%@: %@",titleString,contentString];
}

- (NSString *)dateTypeConverToStringType:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

@end
