//
//  AppDelegate.m
//  YZL_MessageVerification_Demo
//
//  Created by YZL on 16/3/4.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "AppDelegate.h"
#import "YZLMessageVerifiedTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//SMSSDK官网公共key
#define appKey @"f3fc6baa9ac4"
#define appSecrect @"7f3dedcb36d92deebcb373af921d635a"

/* appKey 和 appSecret的获取：
 *（1）到Mob官网注册成为Mob开发者；
 *（2）到应用管理后台新建应用。
    步骤网址：http://bbs.mob.com/forum.php?mod=viewthread&tid=8212&extra=page%3D1
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化应用，appKey和appSecret从后台申请得
    [YZLMessageVerifiedTool registerAppkey:appKey withappSecret:appSecrect];
    return YES;
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
