//
//  MineViewController.swift
//  youke
//
//  Created by 振轩 on 2018/5/12.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    var isLogin:Bool?{
        didSet{
            if isLogin!  {
                let a = UserAccount.loadUserAccount()
                nameLabel.text = UserAccount.account?.nick_Name! as! String
                loginBTN.setTitle("退出登录", for: .normal)
                registBTN.isHidden = true
            }
        }
    }
    
    var titleArray = ["个人资料","修改密码","实名认证","我的订单","我的消息","关于我们"]
    
    var iconArray = ["edit","edit","setting","orders","message","about"]
    override func viewDidLoad() {
        isLogin = UserAccount.isLogin()
        self.iconImageView.layer.cornerRadius = 31
        self.iconImageView.layer.masksToBounds = true
        self.navigationItem.title = "我的优客"
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ii")
        self.tableView.tableFooterView = UIView()
    }
    
    
//[1]    (null)    "token" : "Pn723THf8kTbeF1ywv"
  
    @IBOutlet weak var loadImageView: UIButton!
    
    @IBAction func loadImage(_ sender: Any) {
        
        let param = NSMutableDictionary()
        let account = UserAccount.loadUserAccount()
        
        //param["phone_Number"] = account?.phone_Number
        param["nick_Name"] = "振轩"
        //param["token"] = account?.token
        param["user_Id"] = account?.user_Id
        //param["gender"] = "男"
        let jsonStr:String = String.getJSONStringFromDictionary(dictionary: param)
        let paramJson = NSMutableDictionary()
        paramJson["userInfo"] = jsonStr
        paramJson["token"] = account?.token
        
        
        
        self.showCanEdit(true) { (image) in
            
            self.iconImageView.image = image
            
            guard let imageData = UIImagePNGRepresentation(image!) else {
                return
            }

            
            let str :String = imageData.base64EncodedString()
            
            print("++++++")
            //print(str)
            print("++++++")
            
            //paramJson["picture"] = str
            
            //            NetworkTools.upLoadImageRequest(urlString: "http://192.168.0.222:8080/Maxwell/userInfo/update/user", params: paramJson as! [String : String], data: datas, name: ["1234.png"], success: { (response) in
//
//            }, failture: { (error) in
//
//            })
            NetworkTools.requestData(.post, URLString: "http://192.168.0.222:8080/Maxwell/userInfo/update/user", parameters: paramJson as! [String : Any], finishedCallback: { (response, msg) in
                
            })
        }
    }
    
    
    @IBOutlet weak var registBTN: UIButton!
    
//注册
    @IBAction func register(_ sender: Any) {
        
      present(RegisterViewController(), animated: true, completion: nil)
        
    }
    @IBOutlet weak var loginBTN: UIButton!
    
    
    
    
    @IBAction func Login(_ sender: Any) {
        let vc = LoginViewController()
        vc.callBack = { ()   in
            
            self.isLogin = true
        }
        present(vc, animated: true, completion: nil)
    }
}

extension MineViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return self.titleArray.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "ii", for: indexPath)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: "ii")
        }
        cell.textLabel?.text = titleArray[indexPath.row];
        cell.textLabel?.textColor = UIColor.gray
        cell.imageView?.image = UIImage(named: iconArray[indexPath.row]);
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       switch indexPath.row {
        case 0:
            do {
            
                let nav = UINavigationController(rootViewController: UserCenterTableViewController())
                self.present(nav, animated: true, completion: nil)
            }
            break
       case 2:
        do {
            let nav = UINavigationController(rootViewController: CertificateViewController())
            self.present(nav, animated: true, completion: nil)
           }
           break
       case 3:
        do {
            let nav = UINavigationController(rootViewController: MyOrdersViewController())
            self.present(nav, animated: true, completion: nil)
        }
        break
        
       case 4:
         do {
           let nav = UINavigationController(rootViewController: MessageTableViewController())
           self.present(nav, animated: true, completion: nil)
        }
        break
        default:
            break
        
        }
    }
}



