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
            }
        }
    }
    
    
    
    
    var titleArray = ["个人资料","修改密码","实名认证","我的订单","我的消息","关于我们"]
    
    var iconArray = ["edit","edit","setting","orders","message","about"]
    override func viewDidLoad() {
        isLogin = UserAccount.isLogin()
        
        self.navigationItem.title = "我的优客"
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ii")
        self.tableView.tableFooterView = UIView()
    }
    
    

  
    @IBOutlet weak var loadImageView: UIButton!
    
    @IBAction func loadImage(_ sender: Any) {
        
        
        self.showCanEdit(true) { (image) in
            self.iconImageView.image = image
            
            
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



