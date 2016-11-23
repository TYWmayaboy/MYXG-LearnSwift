//
//  TYWNewFeatureViewController.swift
//  LearnSwift
//
//  Created by apple on 2016/11/23.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TYWNewFeatureViewController: UICollectionViewController {

    private var layout: UICollectionViewFlowLayout = TYWNewFeatureLayout()
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.backgroundColor = UIColor.red
        self.collectionView!.register(TYWNewFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

}

// MARK: UICollectionViewDataSource

extension TYWNewFeatureViewController
{

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return kNewFeatureCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TYWNewFeatureCell
    
        cell.imageIndex = indexPath.item
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let path = collectionView.indexPathsForVisibleItems.last!
        
        if path.item == (kNewFeatureCount - 1) {
            
            let cell = collectionView.cellForItem(at: path) as! TYWNewFeatureCell
            
            cell.startBtnAnimation()
            
        }
        
    }



}

/// TYWNewFeatureCell

private class TYWNewFeatureCell: UICollectionViewCell
{
     var imageIndex: Int? {
        
        didSet {
            
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
            
        }
    
    }
    
    private lazy var iconView = UIImageView()
    
    private lazy var startButton: UIButton = {
        
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: "btn_begin"), for: .normal)
        
        btn.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        
        btn.layer.masksToBounds = true
        
        btn.isHidden = true
        
        return btn
        
    }()
    
    func startButtonClick() -> () {
        
        UIApplication.shared.keyWindow?.rootViewController = TYWTabBarController()
        
    }
    
    func startBtnAnimation() -> () {
        
        startButton.isHidden = false
        
        startButton.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        
        startButton.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: {
            
            self.startButton.transform = CGAffineTransform.identity
            
            }) { (true) in
  
                self.startButton.isUserInteractionEnabled = true
                
        }
    }
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> () {
        
        contentView.addSubview(iconView)
        
        contentView.addSubview(startButton)
        
        iconView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(contentView)
        
        }
        
        startButton.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
            
            make.size.equalTo(CGSize.init(width: 150, height: 40))
            
            make.centerX.equalTo(75)
            
        }
    }
}


private class TYWNewFeatureLayout: UICollectionViewFlowLayout {

     override func prepare() {
        
        itemSize = UIScreen.main.bounds.size
        
        minimumLineSpacing = 0
        
        minimumInteritemSpacing = 0
        
        scrollDirection = .horizontal
        
        collectionView?.showsVerticalScrollIndicator = false
        
        collectionView?.bounces = false
        
        collectionView?.isPagingEnabled = true
        
    }
}
