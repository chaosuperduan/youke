//
//  YKBatButtonItem+Extension.swift
//  youke
//
//  Created by Duan Chao on 2018/5/15.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import Foundation
import UIKit
protocol NibLoad {
    
}
//where作用对谁遵守这个协议做一个限制。
extension NibLoad where Self : UIView
{
    //在协议和类中方法只能用static修饰，而不能用class修饰。
    static func LoadFromNib()->Self{
    return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}


extension UIBarButtonItem{

    class func setUpBarButtonItemWithImage(imageName:String)->UIBarButtonItem {
      
      let imageView:UIImageView = UIImageView.init(frame: CGRect(x: 0, y: -10, width: 44, height: 44))
      imageView.layer.cornerRadius = 22
      imageView.layer.masksToBounds = true
       // imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
      let img = UIImage.init(named: "liuyan")
      let scalImge = img?.scaleToSize(img: img!, size: CGSize.init(width: 44, height: 44))
      imageView.image = scalImge
      //imageView.image = UIImage.init(named: imageName)
      imageView.backgroundColor = UIColor.red
        //imageView.frame =
       // imageView.sizeToFit()
      print(imageView.frame)
        
        
        let item = UIBarButtonItem.init(customView: imageView)
        
        return item
        
    }
    class func createBarButtonItem(imageName:String, target:AnyObject, action:Selector) -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
    
}
extension UIButton{
    
    convenience init(imageName : String,selectImage : String) {
        
        // 便利构造方法必须依赖于指定构造方法!!!!!!!!!!!!!!
        self.init()
        // 初始化按钮
        // 设置按钮图片
        setImage(UIImage(named: imageName), for: UIControlState.normal)
        setImage(UIImage(named: selectImage), for: UIControlState.highlighted)
     }
    
}
