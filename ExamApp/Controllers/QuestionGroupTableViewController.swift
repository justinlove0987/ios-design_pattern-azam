//
//  QuestionGroupTableViewController.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/4/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class QuestionGroupTableViewController :UITableViewController {
    
    private var questionGroups = [QuestionGroup]()
    
    lazy var cellBackgroundView :UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        view.backgroundColor =  UIColor(displayP3Red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        self.questionGroups = getQuestionGroups()
    }
    
    private func getQuestionGroups() -> [QuestionGroup] {
        
        return [
            QuestionGroup(displayName : "Math", course :.math, sourceType : .json),
            QuestionGroup(displayName : "Geography", course: .geography, sourceType: .xml)
        ]
        
    }
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionGroups.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        
        let questionsVC = segue.destination as! QuestionsViewController 
        questionsVC.questionGroup = self.questionGroups[indexPath.row]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupTableViewCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = self.questionGroups[indexPath.row].displayName
        cell.selectedBackgroundView = cellBackgroundView
        
        return cell
    }
}
