//
//  MessageTableViewController.swift
//  youke
//  Created by Duan Chao on 2018/5/14.
//  Copyright © 2018年 M2Micro. All rights reserved.
//
let messCell="message"
import UIKit

class MessageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messCell, for: indexPath)
        return cell
    }
 }

extension MessageTableViewController{
    
    func setUpUI(){
     navigationItem.title = "我的消息"
      self.tableView.register(UINib.init(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier:  messCell)
        tableView.rowHeight = 80
         let item = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = item
    }
    @objc func back(){
        
        dismiss(animated: true, completion: nil)
        
        
    }
}

