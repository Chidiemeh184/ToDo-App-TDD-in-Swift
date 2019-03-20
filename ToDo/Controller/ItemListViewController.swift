//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Chidi Emeh on 3/11/19.
//  Copyright © 2019 Chidi Emeh. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }

}
