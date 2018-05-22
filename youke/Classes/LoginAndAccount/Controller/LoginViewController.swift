//
//  LoginViewController.swift
//  youke
//
//  Created by Duan Chao on 2018/5/18.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var PhoneTF: UITextField!
    
    @IBOutlet weak var pwTF: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        

        
        let param = NSMutableDictionary()
        param["userNum"] = PhoneTF.text
        param["pwd"] = pwTF.text
        
        NetworkTools.requestData(.post, URLString: "http://192.168.0.222:8080/Maxwell/login/loginUser", parameters: param as? [String : Any]) { (response,mes) in
            print(response)
            if  response == nil{
                
                return
                
                
            }else{
                
                let account = UserAccount.init(dic: response!["data"] as! [String : AnyObject])
                
                account.user_Pwd = self.pwTF.text
                account.savaAccout()
                self.callBack!()
                self.dismiss(animated: true, completion: nil)
                
                
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var  callBack:(()->())?
   

}

extension LoginViewController:UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = -200
        }
    }
    
}
