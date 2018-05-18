//
//  UserAccount.swift
//  ZXWeiBo
//
//  Created by 段振轩 on 2018/1/8.
//  Copyright © 2018年 段振轩. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {
    
    
    var access_token:String?
    var expires_in:NSNumber?
    var uid:String?
    var expires_Date : NSDate?
    var remind_in: String?
    {
        didSet{
            expires_Date = NSDate.init(timeIntervalSinceNow: TimeInterval.init(truncating: expires_in!))
        }
    }
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
        self.access_token = dic["access_token"] as? String
        self.remind_in = (dic["remind_in"] as? String)
        self.expires_in = (dic["expires_in"] as! NSNumber)
        self.uid = (dic["uid"] as? String)
        
        
//
//        //super.init()
        //self.setValuesForKeys
       //self.setValuesForKeys(dic)
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
        
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(remind_in, forKey: "remind_in")
        aCoder.encode(expires_Date, forKey: "expires_Date")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(screen_name, forKey: "screen_name")
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        
        self.access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        
        self.remind_in = aDecoder.decodeObject(forKey: "remind_in") as? String
        self.uid = aDecoder.decodeObject(forKey: "uid") as? String
        self.expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        
        self.expires_Date = aDecoder.decodeObject(forKey: "expires_Date") as? NSDate
        self.avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        self.screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
        
    }
    func savaAccout()->Bool{
    
        //生成缓存目录的路径。
       
        //归档对象
        
     print(UserAccount.filePath)
     return  NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.filePath)
        
    }
    
    class func loadUserAccount()->UserAccount?{
        //判断是否加载过。
        if UserAccount.account != nil{
            
            
            return UserAccount.account
            
            
            
        }
        
//        guard let date = account?.expires_Date else{
//
//            return nil
//        }
        
//        if date.compare(NSDate() as Date) == ComparisonResult.orderedAscending{
//            
//            
//            return nil
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
    /*func loadUserInfo(finished: @escaping (_ account: UserAccount?, _ error: NSError?)->()){
        
       assert(access_token != nil,"使用该方法必须现授权")
        
       let  path = "2/users/show.json"
        //准备请求参数。
        let paramers = ["access_token":access_token!,"uid":uid]
        NetworkTools.shareInstance.get(path, parameters: paramers, progress: { (progress) in
            
            
        }, success: { (task, obj) in
            NJLog(message: obj)
            let dict = obj as! [String: AnyObject]
            
            // 1.取出用户信息
            self.avatar_large = dict["avatar_large"] as? String
            self.screen_name = dict["screen_name"] as? String
            
            // 2.保存授权信息
            //            self.saveAccount()
            finished(self, nil)
            
            
            
            
        }) { (task, error) in
            print(error)
        }
        
    }
    */

}

