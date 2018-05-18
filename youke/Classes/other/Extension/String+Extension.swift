//
//  String+Extension.swift
//  ZXWeiBo
//
//  Created by 段振轩 on 2018/1/9.
//  Copyright © 2018年 段振轩. All rights reserved.
//

import Foundation
extension String{
    
    
    
    func cachesDir() -> String {
        // 1.获取缓存目录的路径
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        // 2.生成缓存路径
        
        let name = (self  as NSString).lastPathComponent
        let filePath = (path as NSString).appendingPathComponent(name)
        
        
        return filePath
        
        
        
    }
    
    func temDir() -> String {
        
        
        
        // 1.获取缓存目录的路径
        let path = NSTemporaryDirectory()
        
        
        let name = (self as NSString).lastPathComponent
        // 2.生成缓存路径
        let filePath = (path as NSString).appendingPathComponent(name)
        
        
        return filePath
        
        
    }
    
    
    
    
    
    
    
}
