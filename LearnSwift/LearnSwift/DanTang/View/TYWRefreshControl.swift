//
//  TYWRefreshControl.swift
//  LearnSwift
//
//  Created by apple on 2016/11/26.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWRefreshControl: UIRefreshControl {

    private var rotationArrowFlag = false
    
    private var loadingViewAnimationFlag = false
    
    override init() {
    
        super.init()
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
    
//        addSubview(<#T##view: UIView##UIView#>)
    
        
    }
    
//    private lazy var refreshView: 
}
