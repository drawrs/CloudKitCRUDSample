//
//  ViewController.swift
//  CloudKitSample
//
//  Created by Rizal Hilman on 31/08/20.
//  Copyright © 2020 Rizal Hilman. All rights reserved.
//  CloudKit CRUD Example

import UIKit
import CloudKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let records = [CKRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(fetchDatabase), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
    }
    
    @objc func fetchDatabase(){
        print("Fetching...")
    }
    
    @IBAction func actionAdd(_ sender: Any) {
       // MARK: Create Alert
       let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
       alert.addTextField()
       
       alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
           guard let textField = alert.textFields?[0] else {return}
           let name = textField.text ?? ""
           
       }))
       
       // MARK: Show alert
       self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // MARK: Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // TODO: Which person to remove
           
        }
        
        // MARK: Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}

