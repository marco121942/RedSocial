//
//  ElegirUsuarioViewController.swift
//  Snapchat
//
//  Created by Marco Antonio Sotomayor Lopez on 28/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ElegirUsuarioViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
    }



}
