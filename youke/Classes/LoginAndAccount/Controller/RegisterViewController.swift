//
//  RegisterViewController.swift
//  youke
//
//  Created by 振轩 on 2018/5/12.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var PhoneTF: UITextField!
    
    @IBOutlet weak var identyTF: UITextField!
    @IBOutlet weak var PwTF: UITextField!
    
    @IBOutlet weak var RePwTF: UITextField!
    
    
    @IBOutlet weak var sendButton: UIButton!
    var countdownTimer: Timer?
    
    var remainingSeconds: Int = 0 {
        willSet {
            sendButton.setTitle("(\(newValue)秒后重新获取)", for: .normal)
            if newValue <= 0 {
                sendButton.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime(_:)), userInfo: nil, repeats: true)
                
                remainingSeconds = 5
                
                sendButton.backgroundColor = UIColor.gray
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
                sendButton.backgroundColor = UIColor.red
            }
            
            sendButton.isEnabled = !newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

    }

    @IBAction func Register(_ sender: Any) {
        if PwTF.text != RePwTF.text{
            
        }
        
        let param = NSMutableDictionary()
        param["phone_Number"] = PhoneTF.text
        param["user_Pwd"] = PwTF.text
        param["role_Id"] = "8"
        param["login_Type"] = "72"
        let jsonStr:String = String.getJSONStringFromDictionary(dictionary: param)
        let paramJson = NSMutableDictionary()
        paramJson["user"] = jsonStr
        
        NetworkTools.requestData(.post, URLString: "http://192.168.0.222:8080/Maxwell/reg/regNewUser", parameters: paramJson as? [String : Any]) { (response,mes) in
            print(response)
            guard let respon :[String:AnyObject]=response as! [String : AnyObject] else{
                
                return
            }
        }
        
        
    }
    
    func getIdentyCode(){
        
        let param = NSMutableDictionary()
        param["phoneNumber"] = PhoneTF.text
        param["user_Pwd"] = PwTF.text
        
        NetworkTools.requestData(.get, URLString: "http://192.168.0.125:8080/Maxwell/verify/sms/reg", parameters: param as? [String : Any]) { (response, msg) in
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
    }
    
    @objc func sendButtonClick(_ sender: UIButton) {
        isCounting = true
        getIdentyCode()
        
       // NSLog(<#T##format: String##String#>, <#T##args: CVarArg...##CVarArg#>)
        
        
        print("-----***_____")
        
    }
    
    @objc func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
extension RegisterViewController{
    func setUpUI(){
        
        sendButton.addTarget(self, action: #selector(sendButtonClick(_:)), for: .touchUpInside)
    }
}
extension RegisterViewController:UITextFieldDelegate{
    
}
