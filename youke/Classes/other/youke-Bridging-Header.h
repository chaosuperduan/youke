//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
//#ifndef officialDemoLoc_Swift_Bridging_Header_h
//#define officialDemoLoc_Swift_Bridging_Header_h

#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
//#import "APIKey.h"#
#import"DEFINE.m"
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "UIViewController+XHPhoto.h"
#endif /* officialDemoLoc_Swift_Bridging_Header_h */
