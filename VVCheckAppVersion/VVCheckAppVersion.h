//
//  VVCheckAppVersion.h
//  
//
//  Created by zhx on 2018/5/10.
//  Copyright © 2018年 zhx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HXAppInfoModel;

@interface VVCheckAppVersion : NSObject

+ (void)cheakAppVersion:(NSString *)appID;
+ (void)cheakAppVersion:(NSString *)appID completionHandler:(void (^) (HXAppInfoModel *appInfo))handler;
+ (BOOL)judgeNewVersion:(NSString *)appStoreVersion withOldVersion:(NSString *)currentVersion;

+ (void)showUpdateAppVersionAlterViewWithTrackViewUrl:(NSString *)trackViewUrl showCancelAction:(BOOL)showCancelAction;



@end


@interface HXAppInfoModel : NSObject

@property (nonatomic , copy) NSString * currentVersion;
@property (nonatomic , copy) NSString * onlineVersion;
@property (nonatomic , copy) NSString * trackViewUrl;
@property (nonatomic , assign) BOOL hasNewVersion;

@end


