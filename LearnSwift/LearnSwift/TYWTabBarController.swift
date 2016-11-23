//
//  TYWTabBarController.swift
//  LearnSwift
//
//  Created by apple on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(colorLiteralRed: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
        addChildViewControllers()
        
    }
    
    private func addChildViewControllers(){
    
        addChildViewController(name: "TYWDanTangViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        
        addChildViewController(name: "TYWDanPinViewController", title: "单品", imageName: "TabBar_gift_23x23_")

        addChildViewController(name: "TYWCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")

        addChildViewController(name: "TYWMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")

    }
    
    private func addChildViewController(name: String, title: String, imageName: String){
    
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        
        let cls: AnyClass? = NSClassFromString(ns + "." + name)
        
        let vcClass = cls as! UIViewController.Type
        
        let vc = vcClass.init()
        
        vc.tabBarItem.image = UIImage(named: imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        
        vc.title = title
        
        let nav = TYWNavigationController()
        
        nav.addChildViewController(vc)
        
        addChildViewController(nav)
        
    }

}
