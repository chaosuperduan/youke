//
//  common.swift
//  youke
//
//  Created by 振轩 on 2018/5/12.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import Foundation
import UIKit
let KScreenW = UIScreen.main.bounds.size.width;
let KScreenH = UIScreen.main.bounds.size.height;
let MainColor = UIColor.init(red: 31/255.0, green: 183/255.0, blue: 136/255.0, alpha: 1.0)
let isIphoneX = KScreenH == 812 ? true : false
let tabBarbottomHeight : CGFloat = isIphoneX ? 34 : 0
let IPXstatusHeight:CGFloat = isIphoneX ? 24:0
