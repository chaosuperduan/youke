//
//  AddressViewController.swift
//  youke
//  Created by Duan Chao on 2018/5/16.
//  Copyright © 2018年 M2Micro. All rights reserved.

import UIKit
let addressCell = "addressCell"
class AddressViewController: UIViewController {
    
    
     var DataArray:[AMapPOI]! = [AMapPOI]()
    
    var callBack1:((AMapPOI)->())?

    var naviView:AddressNaviView={
        let view = AddressNaviView.LoadFromNib()
        
        return view
    }()
    var tableview:UITableView = {
      let tableView = UITableView(frame: CGRect.init(x: 0, y: 64+IPXstatusHeight, width: KScreenW, height: KScreenH-64-IPXstatusHeight))
      tableView.tableFooterView = UIView()
       //tableView.backgroundColor = UIColor.red
      return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
}
extension AddressViewController{
    func setUpUI(){
        view.backgroundColor = UIColor.white
        view.addSubview(naviView)
        naviView.callBack = {(text) in
            
                    POISearchManager.sharedInstance.getPoiSearch(city: "深圳市", key: text, page: 1) { (response) in
            
                        self.DataArray = response.pois
                        self.tableview.reloadData()
                    }
        }
        naviView.operation = {(status) in
            if status {
                
            }else{
               self.navigationController?.popViewController(animated: true)
                
            }
        }
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: addressCell)
    }
}
extension AddressViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.DataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: addressCell, for: indexPath)
        if cell == nil  {
             cell = UITableViewCell.init(style: .default, reuseIdentifier: addressCell)
        }
        
        cell.imageView?.image = UIImage.init(named: "location")
        cell.textLabel?.text = self.DataArray[indexPath.row].name
        cell.textLabel?.textColor = UIColor.gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let poi = self.DataArray[indexPath.row]
        
        if self.callBack1 != nil  {
            
            
            callBack1!(poi)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
