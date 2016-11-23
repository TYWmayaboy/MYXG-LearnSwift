//
//  TYWNavigationController.swift
//  LearnSwift
//
//  Created by Mac on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit
import SVProgressHUD

class TYWNavigationController: UINavigationController {

    internal override class func initialize() {
    
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        
        navBar.barTintColor = TYWlobalRedColor()
        
        navBar.tintColor = UIColor.white
        
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func navigationBackClick() -> () {
        
        if SVProgressHUD.isVisible() {
            
            SVProgressHUD.dismiss()
            
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
        popViewController(animated: true)
    }
}
