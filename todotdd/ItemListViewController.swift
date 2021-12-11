//
//  ItemListViewController.swift
//  todotdd
//
//  Created by kevin on 30/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource =  dataProvider
        tableView.delegate = dataProvider
    }
    
}
