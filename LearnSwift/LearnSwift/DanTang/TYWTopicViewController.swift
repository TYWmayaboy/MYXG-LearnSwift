//
//  TYWTopicViewController.swift
//  LearnSwift
//
//  Created by apple on 2016/11/24.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit

let homeCellID = "homeCellID"

class TYWTopicViewController: UITableViewController {

    var type = Int()
    
    var items = [TYWHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = TYWlobalColor()
        
        setupTableView()
        
        refreshControl = TYWRefreshControl()
        
        refreshControl?.beginRefreshing()
        
        refreshControl?.addTarget(self, action: #selector(loadHomeData), for: .valueChanged)
        
        loadHomeData()
    }

    func loadHomeData() {
    
        TYWNetworkTool.shareNetorkTool.loadHomeInfo(id: type) { (homeItems) in
            
            self.items = homeItems
            
            self.tableView.reloadData()
            
            self.refreshControl?.endRefreshing()
        }
    
    }

    func setupTableView() -> () {
    
        tableView.rowHeight = 160
        
        tableView.separatorStyle = .none
        
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        
        tableView.scrollIndicatorInsets = tableView.contentInset
        
        let nib = UINib(nibName: String(describing: TYWHomeCell.self), bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: homeCellID)
        
    }

}

extension TYWTopicViewController :TYWHomeCellDelegate {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! TYWHomeCell
        
        homeCell.selectionStyle = .none
        
        homeCell.homeItem = items[indexPath.row]
        
        homeCell.delegate = self
        
        return homeCell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = TYWDetailViewController()
        
        detailVC.homeItem = items[indexPath.row]
        
        detailVC.title = "攻略详情"
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        
        if !UserDefaults.standard.bool(forKey: isLogin) {
        
//            let loginVC = TYW
            
        
        }
    }
}
