//
//  HotelViewController.swift
//  youke
//
//  Created by Duan Chao on 2018/5/17.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class HotelViewController: UIViewController {
    var ImgeView:HotelImageView! = HotelImageView.LoadFromNib()//HotelImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension HotelViewController{
    
    func setUpUI(){
      ImgeView.frame = CGRect(x: 0, y: 89+153+10, width: KScreenW, height: 254)
      view.addSubview(ImgeView)
      
    }
    
    
}
