//
//  AppSettingsViewController.swift
//  ExamApp
//
//  Created by justin on 2022/5/16.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import UIKit

class AddSettingsTableViewController: UITableViewController {
    
    let appSettings = AppSettings.shared
    
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
        
        if appSettings.questionOrderType == questionOrderType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionOrderType = QuestionOrderType.allCases[indexPath.row]
        appSettings.questionOrderType = questionOrderType
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
