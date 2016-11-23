//
//  TYWChannel.swift
//  LearnSwift
//
//  Created by Mac on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWChannel: NSObject {

    var editable: Bool?
    
    var id: Int?
    
    var name: String?
    
    init(dict: [String: AnyObject]) {
        
        id = dict["id"] as? Int
        
        name = dict["name"] as? String
        
        editable = dict["editable"] as? Bool
    }
    
    
    
}
