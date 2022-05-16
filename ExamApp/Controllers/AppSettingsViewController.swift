//
//  AppSettingsViewController.swift
//  ExamApp
//
//  Created by justin on 2022/5/16.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import UIKit

class AddSettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionOrderType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionOrderTypeTableViewCell", for: indexPath)
        
        let questionOrderType = QuestionOrderType.allCases[indexPath.row]
        
        cell.textLabel?.text = questionOrderType.title
        
        return cell
    }
}
