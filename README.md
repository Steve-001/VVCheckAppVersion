# VVCheckAppVersion
<br>一个检查app版本的工具，已集成cocapods.
<br>```pod 'VVCheckAppVersion' ```

<br> 如果pod搜索不到, ``` pod repo update ``` 更新下pod 库
------------------------------------------------------------
* realse 1.1.0    2020-08-21  修复版本号判断逻辑
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
