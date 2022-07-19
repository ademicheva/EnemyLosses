//
//  LossesByDayViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class LossesByDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let testArray = ["one", "two", "three", "four"]

    
    var dayCount = 140 // number of day - 3 (140 - 138)
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    let data = DataLoader().equipmentLosses
    let arrayOfValues = EquipmentLosses.EquipmentLossesArray
    var currentArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("Data count is \(testArray.count)")
        currentArray = createValues(item: data[dayCount - 2])
        label.text = String(dayCount)
//        label.text = String(data.last!.day)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func createValues(item: EquipmentLosses) -> [String] {
        var equipmentArray: [String] = []
        let mirror = Mirror(reflecting: item)
        
        for i in mirror.children {
            equipmentArray.append(toString(i.value))
        }
        return equipmentArray.map({ return $0 == "0" ? "No info" : $0 })
    }
    
    func toString(_ value: Any?) -> String {
        return String(describing: value ?? "")
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         switch segmentedControl.selectedSegmentIndex {
         case 0:
             return arrayOfValues.count
         case 1:
             return testArray.count
         default:
             break
         }
         return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LossesTVCell
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.nameLabel.text = arrayOfValues[indexPath.row]
            cell.valueLabel.text = currentArray[indexPath.row]
        case 1:
            cell.nameLabel.text = testArray[indexPath.row]
            cell.valueLabel.text = testArray[indexPath.row]
        default:
            break
        }

        return cell
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
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
                    self.dayCount = Int(newTaskTitle)!
                    self.currentArray = self.createValues(item: self.data[self.dayCount - 2])
//                    self.
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
