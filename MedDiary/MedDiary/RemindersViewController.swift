//
//  RemindersViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/1/23.
//

import UIKit

class RemindersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var reminders: [Reminder] = [
       Reminder(title: "Go to bed before 10pm"),
       Reminder(title: "Drink 8 Glasses of Water"),
       Reminder(title: "Commit Today"),
       Reminder(title: "Stand up every Hour")
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
      
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var cell: UITableViewCell
           if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
               cell = dequeueCell
           } else {
               cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
           }
        
           let reminder = reminders[indexPath.row]
         
        cell.textLabel?.text = reminder.title
           return cell
       }


}
extension RemindersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupNavBar() {
            title = "Reminders" // Add a title to the nav bar
            // Create a UIBarButtonItem
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddReminder(_:)))
            // Add the barbuttonitem to the navbar
            navigationItem.rightBarButtonItem = addButton
        }

        // This function handle taps on the bar button item, see #selector above
        @objc func pressAddReminder(_ sender: UIBarButtonItem) {
            reminders.insert(Reminder(title: "New Reminder"), at: 0)
            let topIndexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [topIndexPath], with: .automatic)
        }

    
}
