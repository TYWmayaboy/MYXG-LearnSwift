//
//  TYWDanTangViewController.swift
//  LearnSwift
//
//  Created by Mac on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWDanTangViewController: TYWBaseViewController {

    var channels = [TYWChannel]()
    
    weak var titlesView = UIView()
    
    weak var indicatorView = UIView()
    
    weak var contentView = UIScrollView()
    
    weak var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
        
        TYWNetworkTool.shareNetorkTool.loadDanTangTopData { (ym_channels) in
            
            for channel in ym_channels {
            
                let vc = TYWTopicViewController()
                
                vc.title = channel.name!
                
                vc.type = channel.id!
                
                self.addChildViewController(vc)
            }
            
            
        }

    }

    func setupNav() -> () {
        
        view.backgroundColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(dantangRigtBBClick))
        
    }
    
    func dantangRigtBBClick() -> () {
    
        let searchBarVC = TYWSearchViewController()
        
        navigationController?.pushViewController(searchBarVC, animated: true)
        
    }
    
    func setupTitlesView() -> () {
        
        let bgView = UIView()
        
        bgView.frame = CGRect.init(x: 0, y: kTitlesViewY, width: SCREENW, height: kTitlesViewH)
        
        view.addSubview(bgView)
        
        let titlesView = UIView()
        
        titlesView.backgroundColor = TYWlobalColor()
        
        titlesView.frame = CGRect.init(x: 0, y: 0, width: SCREENW - kTitlesViewH, height: kTitlesViewH)
        
        bgView.addSubview(titlesView)
        
        self.titlesView = titlesView
        
        let indicatorView = UIView()
        
        indicatorView.backgroundColor = TYWlobalRedColor()
        
        indicatorView.frame = CGRect.init(x: 0, y: kTitlesViewH - kIndicatorViewH, width: 0, height: kIndicatorViewH)
        
        indicatorView.tag = -1

        self.indicatorView = indicatorView
        
        let arrowButton = UIButton()
        
        arrowButton.frame = CGRect.init(x: SCREENW - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
        
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        
        arrowButton.addTarget(self, action: #selector(arrowButtonClick(_:)), for: .touchUpInside)
        
        arrowButton.backgroundColor = TYWlobalColor()
        
        bgView.addSubview(arrowButton)
        
        let count = childViewControllers.count
        
        let width = titlesView.frame.width / CGFloat(count)
        
        let height = titlesView.frame.height
        
        for index in 0..<count {
            
            let button = UIButton()
            
            button.frame = CGRect.init(x: CGFloat(index) * width, y: 0, width: width, height: height)
            
            button.tag = index
            
            let vc = childViewControllers[index]
            
            button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            
            button.setTitle(vc.title!, for: .normal)
            
            button.setTitleColor(UIColor.gray, for: .normal)
            
            button.setTitleColor(TYWlobalRedColor(), for: .disabled)
            
            button.addTarget(self, action: #selector(titleClick(_:)), for: .touchUpInside)
            
            titlesView.addSubview(button)
            
            if index == 0 {
                
                button.isEnabled = false
                
                selectedButton = button
                
                button.titleLabel?.sizeToFit()
                
                indicatorView.frame = CGRect.init(x: indicatorView.frame.minX, y: indicatorView.frame.minY, width: (button.titleLabel?.frame.width)!, height: indicatorView.frame.height)
                
                indicatorView.center.x = button.center.x
                
            }
            
            titlesView.addSubview(indicatorView)
            
        }
        
        func arrowButtonClick(button: UIButton) {
        
        UIView.animate(withDuration: kAnimationDuration) { 
            
            
            button.imageView?.transform = CGAffineTransform.rotated(CGFloat(M_PI))
            
            }
        }
        
        func titleClick(button: UIButton) {
        
            selectedButton!.isEnabled = true
            
            button.isEnabled = false
            
            selectedButton = button
            
            UIView.animate(withDuration: kAnimationDuration) { 
                
                
            }
        }
        
        
        
    }
}
