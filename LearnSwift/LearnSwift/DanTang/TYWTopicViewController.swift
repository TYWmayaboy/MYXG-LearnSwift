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
        
        

    }


    func setupTableView() -> () {
    
        tableView.rowHeight = 160
        
        tableView.separatorStyle = .none
        
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        
        tableView.scrollIndicatorInsets = tableView.contentInset
        
        let nib = UINib(nibName: String(describing: TYWHomeCell.self), bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: homeCellID)
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
