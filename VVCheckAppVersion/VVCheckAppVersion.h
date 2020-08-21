//
//  VVCheckAppVersion.h
//  
//
//  Created by zhx on 2018/5/10.
//  Copyright © 2018年 zhx. All rights reserved.
// app版本号检测，强制更新

#import <Foundation/Foundation.h>
@class HXAppInfoModel;

@interface VVCheckAppVersion : NSObject

+ (void)cheakAppVersion:(NSString *)appID;
+ (void)cheakAppVersion:(NSString *)appID completionHandler:(void (^) (HXAppInfoModel *appInfo))handler;
+ (BOOL)isShouldUpdateOnlineVersion:(NSString *)onlineVersion currentVersion:(NSString *)currentVersion;

+ (void)showUpdateAppVersionAlterViewWithTrackViewUrl:(NSString *)trackViewUrl showCancelAction:(BOOL)showCancelAction;


@end


@interface HXAppInfoModel : NSObject

@property (nonatomic , copy) NSString * currentVersion;
@property (nonatomic , copy) NSString * onlineVersion;
@property (nonatomic , copy) NSString * trackViewUrl;
@property (nonatomic , assign) BOOL hasNewVersion;

@end


