//
//  UserAccount.swift
//  ZXWeiBo
//
//  Created by 段振轩 on 2018/1/8.
//  Copyright © 2018年 段振轩. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {
    
    
   @objc var token:String?
   @objc var role_Id:NSNumber?
   @objc var nick_Name:String?
   @objc var user_Id:NSNumber?
   @objc var login_Type:NSNumber?
   @objc var age : NSNumber?
   @objc var phone_Number:String?
   @objc var user_Pwd:String?
   @objc var registId:String?
    

    ///  用户头像地址（大图），180×180像素
    var avatar_large: String?
    /// 用户昵称
    var screen_name: String?
    
    static var account:UserAccount?
    //存储位置的变量。
    static let filePath = "useraccount.plist".cachesDir()
    
    
    //生命周期的方法。
   init(dic:[String:AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
//    override var description: String{
//        let property = ["access_token","expires_in","var remind_in","uid","expires_Date"]
//        let dic = dictionaryWithValues(forKeys: property)
//        return "\(dic)"
//
//
//
//    }
    
    
    func encode(with aCoder: NSCoder) {
       
        aCoder.encode(token, forKey: "token")
        aCoder.encode(user_Id, forKey: "user_Id")
        
        aCoder.encode(phone_Number, forKey: "phone_Number")
        aCoder.encode(role_Id, forKey: "role_Id")
        aCoder.encode(login_Type, forKey: "login_Type")
        aCoder.encode(nick_Name, forKey: "nick_Name")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(user_Pwd, forKey: "user_Pwd")
         aCoder.encode(user_Pwd, forKey: "registId")
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        
        self.token = aDecoder.decodeObject(forKey: "token") as? String
        
        self.user_Id = aDecoder.decodeObject(forKey: "user_Id") as? NSNumber
        self.phone_Number = aDecoder.decodeObject(forKey: "phone_Number") as? String
        self.login_Type = aDecoder.decodeObject(forKey: "login_Type") as? NSNumber
        
        self.nick_Name = aDecoder.decodeObject(forKey: "nick_Name") as? String
        self.avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        self.screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
        self.user_Pwd = aDecoder.decodeObject(forKey: "user_Pwd") as? String
        self.user_Pwd = aDecoder.decodeObject(forKey: "registId") as? String
        
    }
    func savaAccout()->Bool{
    
        //生成缓存目录的路径。
       
        //归档对象
        
     print(UserAccount.filePath)
     return  NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.filePath)
        
    }
    
    class func loadUserAccount()->UserAccount?{
        //判断是否加载过。
//        if UserAccount.account != nil{
//
//
//            return UserAccount.account
//
//            
//
//        }
        
        guard let account = NSKeyedUnarchiver.unarchiveObject(withFile: UserAccount.filePath) as? UserAccount else
        {
            return UserAccount.account
        }
        UserAccount.account = account
        
        return UserAccount.account
    }
    
    class func isLogin()->Bool{
        return UserAccount.loadUserAccount() != nil
        
    }
    

}

