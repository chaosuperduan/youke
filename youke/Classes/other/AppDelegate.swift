//
//  AppDelegate.swift
//  youke
//
//  Created by m2m on 2018/5/11.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit
import AMapFoundationKit

let APIKey = "a74803fd267a584079f792c0d426905d";
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        
        //状态栏文字改成白色
        UIApplication.shared.statusBarStyle = .lightContent;
        UINavigationBar.appearance().titleTextAttributes = [kCTFontAttributeName as NSAttributedStringKey:UIFont.boldSystemFont(ofSize: 22),kCTForegroundColorAttributeName as NSAttributedStringKey:UIColor.lightGray] as [NSAttributedStringKey : Any]

        //UINavigationBar.appearance().tintColor = UIColor.red
       AMapServices.shared().apiKey = APIKey
       return true
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

