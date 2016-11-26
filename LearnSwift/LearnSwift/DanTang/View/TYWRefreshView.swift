//
//  TYWRefreshView.swift
//  LearnSwift
//
//  Created by apple on 2016/11/26.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWRefreshView: UIView {

    @IBOutlet weak var loadingView: UIImageView!

    @IBOutlet weak var tipView: UIView!

    @IBOutlet weak var arrowIcon: UIImageView!

    func rotationArrowIcon(flag: Bool) {
    
        var angle = M_PI
        
        angle += flag ? -0.01 : 0.01
        
        UIView.animate(withDuration: kAnimationDuration) { 
            
            self.arrowIcon.transform = CGAffineTransform.init(rotationAngle: CGFloat(angle))
            
        }
        
        func startLoadViewAnimation() {
        
            tipView.isHidden = true
            
            let animation = CABasicAnimation(keyPath: "transform.rotation")
            
            animation.toValue = 2 * M_PI
            
            animation.duration = 1
            
            animation.repeatCount = 1
            
            animation.isRemovedOnCompletion = false
            
            loadingView.layer.add(animation, forKey: nil)
            
        }
        
        func stopLoadingViewAnimation() {
        
            tipView.isHidden = false
            
            loadingView.layer.removeAllAnimations()
            
        }
        
        func refreshView() -> TYWRefreshView {
        
            return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! TYWRefreshView
        }
    
    }
}
