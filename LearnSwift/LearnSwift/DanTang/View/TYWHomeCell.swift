//
//  TYWHomeCell.swift
//  LearnSwift
//
//  Created by apple on 2016/11/25.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit
import Kingfisher

protocol TYWHomeCellDelegate: NSObjectProtocol {
    
    func homeCellDidClickedFavoriteButton(button: UIButton)
}

class TYWHomeCell: UITableViewCell {
    
    weak var delegate: TYWHomeCellDelegate?

    @IBOutlet weak var placeholderBtn: UIButton!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var titileLabel: UILabel!
    
    var homeItem: TYWHomeItem? {
    
        didSet {
        
            let url = homeItem!.cover_image_url
            
            bgImageView.kf.setImage(with: url as! Resource?, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
                self.placeholderBtn.isHidden = true
            }
            
            titileLabel.text = homeItem!.title
            
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!), for: .normal)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        
        favoriteBtn.layer.masksToBounds = true
        
        favoriteBtn.layer.rasterizationScale = UIScreen.main.scale
        
        favoriteBtn.layer.shouldRasterize = true
        
        bgImageView.layer.cornerRadius = kCornerRadius
        
        bgImageView.layer.masksToBounds = true
        
        bgImageView.layer.shouldRasterize = true
        
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
        
    }

    @IBAction func favoriteButtonClick(_ sender: UIButton) {
        
        delegate?.homeCellDidClickedFavoriteButton(button: sender)
    }
    
}
