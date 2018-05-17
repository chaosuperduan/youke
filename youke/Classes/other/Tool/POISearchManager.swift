//
//  POISearchManager.swift
//  youke
//
//  Created by Duan Chao on 2018/5/16.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class POISearchManager: NSObject{
    static let sharedInstance = POISearchManager()
    
    var ID:Int?
    var _CallBack:((AMapPOISearchResponse)->Void)?
    var DataArray:[AMapPOI]! = [AMapPOI]()
    var search:AMapSearchAPI={
        let search = AMapSearchAPI()
        
        return search!
        
        
    }()
    var request:AMapPOIKeywordsSearchRequest = AMapPOIKeywordsSearchRequest()
    private override init() {
    
    }
    // 私有化init方法
    func getPoiSearch(city:NSString,key:String,page:NSInteger,callBack:@escaping ((AMapPOISearchResponse)->Void)){
        _CallBack = callBack
        self.search.delegate = self
        request.city = city as String?
       request.keywords = key
       request.page = page
       search.aMapPOIKeywordsSearch(request)
    }
    
}
extension POISearchManager:AMapSearchDelegate{
    
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        _CallBack!(response)
    
    }
}



