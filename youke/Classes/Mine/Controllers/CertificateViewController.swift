//
//  CertificateViewController.swift
//  youke
//
//  Created by Duan Chao on 2018/5/14.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class CertificateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "实名认证"
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension CertificateViewController{
    
    
    func setUpUI(){
        let item = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = item
    }
    @objc func back(){
        
        dismiss(animated: true, completion: nil)
        
        
    }

    
    
    
}
