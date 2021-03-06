//
//  TYWNetworkTool.swift
//  LearnSwift
//
//  Created by apple on 2016/11/24.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class TYWNetworkTool: NSObject {

    static let shareNetorkTool = TYWNetworkTool()
    
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [TYWHomeItem]) -> ()) {
        
        let url = BASE_URL + "v1/channels/\(id)/items"
        
        let params = ["gender": 1, "generation": 1, "limit": 20, "offset": 0]
        
        Alamofire
            .request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                
                guard response.result.isSuccess else {
                
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    
                    return
                }
                
                if let value = response.result.value {
                
                    let dict = JSON(value)
                    
                    let code = dict["code"].intValue
                    
                    let message = dict["message"].stringValue
                    
                    guard code == RETURN_OK else {
                    
                        SVProgressHUD.showInfo(withStatus: message)
                    
                        return
                    }
                    
                    let data = dict["data"].dictionary
                    
                    if let items = data!["items"]?.arrayObject {
                    
                        var homeItems = [TYWHomeItem]()
                        
                        for item in items {
                        
                            let homeItem = TYWHomeItem(dict: item as! [String: AnyObject])
                            
                            homeItems.append(homeItem)
                        
                        }
                        
                        finished(homeItems)
                    
                    }
                    
                }
        }
        
        
    }
    
    func loadDanTangTopData(finished:@escaping (_ ym_channels: [TYWChannel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset"
        
        let params = ["gender":1, "generation": 1]
        
      Alamofire
        .request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
        .responseJSON { (response) in
            
            guard response.result.isSuccess else {
            
                SVProgressHUD.showError(withStatus: "加载失败")
            
                return
            }
            
            if let value = response.result.value {
            
                let dic = JSON(value)
                
                let code = dic["code"].intValue
                
                let message = dic["message"].stringValue
                
                guard code == RETURN_OK else {
                
                    SVProgressHUD.showInfo(withStatus: message)
                    
                    return
                }
                
                SVProgressHUD.dismiss()
                
                let data = dic["data"].dictionary
                
                if let channels = data!["channels"]?.arrayObject {
                
                    var ym_channels = [TYWChannel]()
                    
                    for channel in channels {
                    
                        let ym_channel = TYWChannel(dict: channel as! [String: AnyObject])
                        
                        ym_channels.append(ym_channel)
                    }
                    
                    finished(ym_channels)
                
                }
            }
        }
        
    }
}
