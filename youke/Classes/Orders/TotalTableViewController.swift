//
//  TotalTableViewController.swift
//  youke
//
//  Created by Duan Chao on 2018/5/17.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit
let orderCell = "OrdersCell"
class TotalTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
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
        return 10
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: orderCell, for: indexPath)
        if cell == nil {
            cell = OrdersTableViewCell.LoadFromNib()
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(HotelViewController(), animated: true)
    }
}
extension TotalTableViewController{
    func setUpUI(){
       tableView.rowHeight = 111
       tableView.register(UINib.init(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: orderCell)
    }
}
