//
//  MainTabBarViewController.swift
//  youke
//
//  Created by 振轩 on 2018/5/12.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addChildViewControllers(){
        
        
    }
    
    func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        
        // 1.3包装一个导航控制器
        let nav = UINavigationController(rootViewController: childController)
        // 1.4将子控制器添加到UITabBarController中
        addChildViewController(nav)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
