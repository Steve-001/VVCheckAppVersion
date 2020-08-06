//
//  AppDelegate.m
//  VVCheckAppVersionDemo
//
//  Created by zhx on 2020/8/6.
//  Copyright © 2020 inno. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "VVCheckAppVersion.h"
@interface AppDelegate ()



@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

#define kApp_ID   @"1342097890"
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [VVCheckAppVersion cheakAppVersion:kApp_ID];
}


@end
