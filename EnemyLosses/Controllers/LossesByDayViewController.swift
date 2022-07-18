//
//  LossesByDayViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class LossesByDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let testArray = ["one", "two", "three", "four"]

    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return testArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LossesTVCell
        cell.nameLabel.text = testArray[indexPath.row]
        cell.valueLabel.text =  testArray[indexPath.row]
        return cell
    }
    
    /*
     let alertController = UIAlertController(title: "New Task", message: "Please add new task", preferredStyle: .alert)
     let saveAction = UIAlertAction(title: "Save", style: .default) { action in
         let tf = alertController.textFields?.first
         if let newTaskTitle = tf?.text {
           //  self.tasks.insert(newTask, at: 0)
             self.saveTask(withTitle: newTaskTitle)
             self.tableView.reloadData()
         }
     }

     alertController.addTextField { _ in }
     let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
     
     alertController.addAction(saveAction)
     alertController.addAction(cancelAction)
     present(alertController, animated: true, completion: nil)
     */
    

    @IBAction func okButtonPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: "Enter the day", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "OK", style: .default) { action in
            let textField = ac.textFields?.first
            if let newTaskTitle = textField?.text {
                if newTaskTitle == "" || Int(newTaskTitle)! >= 140  {
                    let ac2 = UIAlertController(title: "WARNING", message: "There is no info on this day. Please, enter another day", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    ac2.addAction(ok)
                    self.present(ac2, animated: true, completion: nil)
                }
                else {
                    self.label.text = newTaskTitle
                    self.tableView.reloadData()
                }
            }
        }
        ac.addTextField { _ in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
