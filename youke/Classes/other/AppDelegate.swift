//
//  AppDelegate.swift
//  youke
//
//  Created by m2m on 2018/5/11.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

/// 状态栏高度
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度
let kNavBarHeight: CGFloat = 44.0
/// 状态栏+导航栏的高度
let kStatusAndNavBarHeight: CGFloat = (kStatusBarHeight + kNavBarHeight)
/// 底部菜单栏高度
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)

let kMenuWidth = UIScreen.main.bounds.width * 0.82
import UIKit
import AMapFoundationKit

let APIKey = "a74803fd267a584079f792c0d426905d";
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        
//        //状态栏文字改成白色
//        UIApplication.shared.statusBarStyle = .lightContent;
//        UINavigationBar.appearance().titleTextAttributes = [kCTFontAttributeName as NSAttributedStringKey:UIFont.boldSystemFont(ofSize: 22),kCTForegroundColorAttributeName as NSAttributedStringKey:UIColor.lightGray] as [NSAttributedStringKey : Any]

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navi  = FWNavigationController.init(rootViewController: HomeViewController())
        let menuContrainer = FWSideMenuContainerViewController.container(centerViewController: navi, leftMenuViewController: MineViewController(), rightMenuViewController: MineViewController())
        menuContrainer.leftMenuWidth = kMenuWidth
        menuContrainer.rightMenuWidth = kMenuWidth
        
        self.window?.rootViewController = menuContrainer
        self.window?.makeKeyAndVisible()
        //UINavigationBar.appearance().tintColor = UIColor.red
        window?.backgroundColor = UIColor.white
       AMapServices.shared().apiKey = APIKey
        //极光推送;
        
        JPUSHService.register(forRemoteNotificationTypes: (UIUserNotificationType.badge.union(UIUserNotificationType.sound).union(UIUserNotificationType.alert)).rawValue, categories:nil)
        
        
        JPUSHService.setup(withOption: launchOptions, appKey:"6d92d607e495ec154c1a9c17", channel:"", apsForProduction:true)
        
        
        //        let center : UNUserNotificationCenter = UNUserNotificationCenter
        //注册一个通知，我们从通知拿到registID
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.self.networkDidLogin(notification:)), name: NSNotification.Name.jpfNetworkDidLogin, object: nil)
        return true
     }
    
    
    //在这里拿到divieToken 向极光注册拿到registID;拿到registID后可能需要上传到您的应用服务器，
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print("divceToken"+"\(deviceToken)");
        
        JPUSHService.registerDeviceToken(deviceToken)
        
    }

    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        
        print("接到通知")
        
        JPUSHService.handleRemoteNotification(userInfo)
        
        application.applicationIconBadgeNumber=0
        
        JPUSHService.resetBadge()
        
        if(application.applicationState == .active) {
            
            //在前台活动do nothing
            
            let alertView = UIAlertView(title: "消息", message: "您有一条新的消息", delegate: self as! UIAlertViewDelegate, cancelButtonTitle: "取消", otherButtonTitles: "查看")
            
            alertView.show()
            
        }else{
            
            //后台或者没有活动
            
        }
        
        
        
        
    }

    
    
    
    @objc public func networkDidLogin(notification:NSNotification){
        
        if (JPUSHService.registrationID() != nil) {
            
            
            let str:String = JPUSHService.registrationID()
            
            print("registId:"+str);
            
//            if (UserAccount.isLogin() && str != nil) {
//                
//                
//                let  account:UserAccount =  UserAccount.loadUserAccount()!
//                
//                account.registId = str
//                 account.savaAccout()
//              }
       }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
      
    }
}

extension AppDelegate {
    
    class func resizableImage(imageName: String, edgeInsets: UIEdgeInsets) -> UIImage? {
        
        let image = UIImage(named: imageName)
        if image == nil {
            return nil
        }
        let imageW = image!.size.width
        let imageH = image!.size.height
        
        return image?.resizableImage(withCapInsets: UIEdgeInsetsMake(imageH * edgeInsets.top, imageW * edgeInsets.left, imageH * edgeInsets.bottom, imageW * edgeInsets.right), resizingMode: .stretch)
    }
    
    /// 将颜色转换为图片
    ///
    /// - Parameter color: 颜色
    /// - Returns: UIImage
    class func getImageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

