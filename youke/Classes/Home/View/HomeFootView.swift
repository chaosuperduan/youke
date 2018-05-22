//
//  HomeFootView.swift
//  youke
//
//  Created by Duan Chao on 2018/5/15.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit
enum methodOP{
    
    
    case address,startTime,endTime
}

class HomeFootView: UIView {
    
    @IBOutlet weak var addressBtn: UIButton!
    
    
    @IBOutlet weak var StartBtn: UIButton!
    @IBOutlet weak var endBTN: UIButton!
    
    @IBOutlet weak var priceTF: UITextField!
    var callBak:(()->())?
    var operationBlock:((methodOP,String,@escaping PassBak)->())?
    class func LoadView()->HomeFootView{
    let view:HomeFootView  = Bundle.main.loadNibNamed("HomeFootView", owner: nil, options: nil)!.first as! HomeFootView
        return view
    }
  
    @IBAction func addressClick(_ sender: Any) {
        
        self.operationBlock!(methodOP.address,"在的",{ str in
            self.addressBtn.setTitle(str, for: .normal)
            
            })
    }
    
    @IBAction func startTimeClick(_ sender: Any) {
        //self.priceTF.resignFirstResponder()
    }
    @IBAction func endTimeClick(_ sender: Any) {
        
        
    }
}
extension HomeFootView:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        self.operationBlock!(methodOP.address,"在的",{ str in
//            self.addressBtn.setTitle(str, for: .normal)
//            
//        })
        
    }
}
