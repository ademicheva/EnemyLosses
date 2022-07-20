//
//  LossesByDayViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class LossesByDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let testArray = ["one", "two", "three", "four"]

    
    var dayCount = 140
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    let dataEquipment = DataLoader(lossesValue: LossesValue.equipment).equipmentLosses
    let dataPersonnel = DataLoaderPersonnel().personnelLosses
    let arrayOfValuesEquipment = EquipmentLosses.EquipmentLossesArray
    let arrayOfValuesPersonnel = PersonnelLosses.PersonnelLossesArray
    var currentArrayEquipment: [String] = []
    var currentArrayPersonnel: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 10
        tableView.showsVerticalScrollIndicator = false
        
        okButton.layer.cornerRadius = 5
        okButton.layer.borderWidth = 2
        okButton.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.5)

        
        currentArrayEquipment = createValues(item: dataEquipment[dayCount - 2])
        currentArrayPersonnel = createValuesPersonnel(item: dataPersonnel[dayCount - 2])
        print("Data personnel count \(dataPersonnel.count)")
        print("Data equipment count \(dataEquipment.count)")
        label.text = String(dayCount)
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
    
    func createValuesPersonnel(item: PersonnelLosses) -> [String] {
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
             return arrayOfValuesEquipment.count
         case 1:
             return arrayOfValuesPersonnel.count
         default:
             break
         }
         return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LossesTVCell
        cell.backgroundView = nil
//        cell.isSelected = true
      //  cell.backgroundColor = .clear
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.nameLabel.text = arrayOfValuesEquipment[indexPath.row]
            cell.valueLabel.text = currentArrayEquipment[indexPath.row]
        case 1:
            cell.nameLabel.text = arrayOfValuesPersonnel[indexPath.row]
            cell.valueLabel.text = currentArrayPersonnel[indexPath.row]
        default:
            break
        }

        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
    
    
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
                    self.currentArrayEquipment = self.createValues(item: self.dataEquipment[self.dayCount - 2])
                    self.currentArrayPersonnel = self.createValuesPersonnel(item: self.dataPersonnel[self.dayCount - 2])
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
