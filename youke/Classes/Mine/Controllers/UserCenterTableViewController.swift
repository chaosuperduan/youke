//
//  UserCenterTableViewController.swift
//  youke
//
//  Created by Duan Chao on 2018/5/14.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit
let userID = "userID"
let userIcon = "userIcon"
class UserCenterTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "编辑资料"
        self.view.backgroundColor = UIColor.white
        setUpUi()
       
    }
    
    
    func setUpUi(){
        navigationItem.title = "编辑资料"
////        self.navigationBar.titleTextAttributes = {[
////            kCTForegroundColorAttributeName: UIColor.whiteColor(),
////            kCTFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!
//            ]}()
        let item = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem  = item;
        tableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: userID)
        tableView.register(UINib.init(nibName: "UserImageViewCell", bundle: nil), forCellReuseIdentifier: userIcon)
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
        
    
    }
    @objc func back(){
        
       dismiss(animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
          let cell = tableView.dequeueReusableCell(withIdentifier: userIcon, for: indexPath)
            return cell
        }else{
            
           let cell = tableView.dequeueReusableCell(withIdentifier: userID, for: indexPath)
            return cell
        }
       
    }
    
  
}
