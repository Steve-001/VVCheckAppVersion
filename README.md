# VVCheckAppVersion
<br>一个检查app版本的工具，已集成cocapods.
<br>```pod 'VVCheckAppVersion' ```


------------------------------------------------------------
* realse 1.0.0    2020-08-06   


### 使用示例
```
#import <AppDelegate.h>
#import <VVCheckAppVersion.h>


static const NSString *kApp_ID = @"134206789";
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [VVCheckAppVersion cheakAppVersion:kApp_ID];
}
```
