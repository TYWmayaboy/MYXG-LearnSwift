//
//  TYWBaseViewController.swift
//  LearnSwift
//
//  Created by Mac on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class TYWBaseViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = TYWlobalRedColor()
        
        navigationController?.fd_prefersNavigationBarHidden = true
        
        SVProgressHUD.setDefaultStyle(.custom)
        
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        
        SVProgressHUD.setForegroundColor(UIColor.white)
    }

}
