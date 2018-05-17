//
//  HomeFootView.swift
//  youke
//
//  Created by Duan Chao on 2018/5/15.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class HomeFootView: UIView {
    
   var callBak:(()->())?

   class func LoadView()->HomeFootView{
   let view:HomeFootView  = Bundle.main.loadNibNamed("HomeFootView", owner: nil, options: nil)!.first as! HomeFootView
        return view
    }

}
