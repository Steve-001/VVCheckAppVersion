//
//  VVCheckAppVersion.m
//
//
//  Created by zhx on 2018/5/10.
//  Copyright © 2018年 zhx. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "VVCheckAppVersion.h"


@implementation VVCheckAppVersion


+ (void)cheakAppVersion:(NSString *)appID{
    [self cheakAppVersion:appID completionHandler:^(HXAppInfoModel *appInfo) {
        BOOL hasNewVersion = appInfo.hasNewVersion;
        if (hasNewVersion){
            [self showUpdateAppVersionAlterViewWithTrackViewUrl:appInfo.trackViewUrl showCancelAction:NO];
        }
    }];
}

+ (void)showUpdateAppVersionAlterViewWithTrackViewUrl:(NSString *)trackViewUrl showCancelAction:(BOOL)showCancelAction{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"检测到新版本，立即更新" preferredStyle:UIAlertControllerStyleAlert];
    if (showCancelAction) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:action1];
    }
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"去更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //跳转到AppStore，该App下载界面
        NSURL * url = [NSURL URLWithString:trackViewUrl];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                
            }];
        }
        
    }];
    [alertVc addAction:action2];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVc animated:YES completion:nil];
    
}
#pragma mark 判断是否需要提示更新App
+ (void)cheakAppVersion:(NSString *)appID completionHandler:(void (^) (HXAppInfoModel *appInfo))handler{
    //App内info.plist文件里面版本号
    
    // NSString *bundleId   = infoDict[@"CFBundleIdentifier"];
    //两种请求appStore最新版本app信息 通过bundleId与appleId判断
    //[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?bundleid=%@", bundleId]
    //[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", appleid]
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", appID];
    
    NSURL *urlStr = [NSURL URLWithString:urlString];
    //创建请求体
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlStr];
    NSURLSessionDataTask *sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
//            NSLog(@"checkAppVersion error:%@", error.localizedDescription);
            return ;
        }
        
        if (data == nil) {
            return;
        }
        
        NSDictionary * infoData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
        NSArray *sourceArray = infoData[@"results"];
        
//        NSLog(@"data:%@ appInfoData:%@",data,infoData);
        if (sourceArray.count >= 1) {
            
            NSDictionary *sourceDict = sourceArray[0];
            NSString *onlineVersion = sourceDict[@"version"];
            
            NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
            NSString *appVersion = infoDict[@"CFBundleShortVersionString"];
            BOOL hasNewVersion = [self isShouldUpdateOnlineVersion:onlineVersion currentVersion:appVersion];
                        
            HXAppInfoModel *appInfo = [[HXAppInfoModel alloc] init];
            appInfo.onlineVersion = onlineVersion;
            appInfo.currentVersion = appVersion;
            appInfo.hasNewVersion = hasNewVersion;
            appInfo.trackViewUrl = sourceDict[@"trackViewUrl"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (handler) {
                    handler(appInfo);
                }
            });
            
        }
        
    }];
    [sessionTask resume];
}

//判断当前app版本和AppStore最新app,版本大小
+ (BOOL)isShouldUpdateOnlineVersion:(NSString *)onlineVersion currentVersion:(NSString *)currentVersion {
    
#ifdef DEBUG
    NSLog(@"-----onlineVersion:%@ currentVersion:%@",onlineVersion,currentVersion);
#endif
    if (onlineVersion == nil ||
        currentVersion == nil) {
        return NO;
    }
    
    if ([currentVersion compare:onlineVersion options:NSNumericSearch] == NSOrderedAscending) {
        
        return YES;
    }else {
        return NO;
    }
}

@end


@implementation HXAppInfoModel

@end
