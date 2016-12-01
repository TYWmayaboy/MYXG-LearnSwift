//
//  TYWSearchViewController.swift
//  LearnSwift
//
//  Created by apple on 2016/11/24.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

class TYWSearchViewController: TYWBaseViewController {

    var results = [TYWSearchResult]()
    
    weak var collectionView: UICollectionView?
    
    private lazy var searchBar: UISearchBar = {
    
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "搜索商品、专题"
        
        return searchBar
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setupNav() {
    
        navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(navigationBackClick))
    }
    
    func navigationBackClick() {
        
        navigationController?.popViewController(animated: true)
    
    }

}
