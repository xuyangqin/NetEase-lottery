//
//  AppDelegate.m
//  网易彩票
//
//  Created by ios on 16/6/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "MMTabBarController.h"
#import "MMGuideController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if ([self isNewVersion]) {
        self.window.rootViewController = [[MMGuideController alloc]init];
    }else{
        self.window.rootViewController = [[MMTabBarController alloc]init];
    }
    [self.window makeKeyAndVisible];
    //设置程序状态栏的效果
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    return YES;
}
- (BOOL)isNewVersion{
    // 1.获取应用当前的版本号
    // 1.1 获取info.plist文件所有内容
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    // 1.2 获取版本号
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    // 2.获取之前存储的版本号
    // 2.1 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:@"app_version"];
    // 3.比较
    //如果相等，直接进入主程序，如果不相等，进入新特性
    if ([currentVersion isEqualToString:lastVersion]) {
        return YES;
    }else{
        //存储当前的版本号
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:currentVersion forKey:@"app_version"];
        [defaults synchronize];
        return YES;
    }
   }
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
