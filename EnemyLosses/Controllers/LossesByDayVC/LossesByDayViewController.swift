//
//  LossesByDayViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class LossesByDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var lastDay: Int = 0
    var dayCount: Int = 0
    
    var dataEquipmentLosses: [EquipmentLosses] = []
    var dataPersonnelLosses: [PersonnelLosses] = []
    
    let arrayOfValuesEquipment = EquipmentLosses.EquipmentLossesArray
    let arrayOfValuesPersonnel = PersonnelLosses.PersonnelLossesArray
    var currentArrayEquipment: [String] = []
    var currentArrayPersonnel: [String] = []
    
    weak var addOkButton: UIAlertAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayCount = dataEquipmentLosses.last?.day ?? 0
        lastDay = dataEquipmentLosses.last?.day ?? 0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 10
        tableView.showsVerticalScrollIndicator = false
        
        okButton.layer.cornerRadius = 7
        okButton.layer.borderWidth = 1
        okButton.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.6)
        
        currentArrayEquipment = createValues(item: dataEquipmentLosses[dayCount - 2])
        currentArrayPersonnel = createValuesPersonnel(item: dataPersonnelLosses[dayCount - 2])
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
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: "Enter a day", message: "", preferredStyle: .alert)
        
        ac.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.delegate = self
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.checkNumbers), name: UITextField.textDidChangeNotification, object: textField)
        }
        
        func removeTextFieldObserver() {
            NotificationCenter.default.removeObserver(self, name: UITextField.textDidChangeNotification, object: ac.textFields![0])
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            removeTextFieldObserver()
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            removeTextFieldObserver()
            
            let textField = ac.textFields?.first
                if let newTaskTitle = textField?.text {
                    if Int(newTaskTitle)! > self.lastDay  ||  Int(newTaskTitle)! < 2   {
                        Alert.showErrorValueAlert(on: self)
                    } else {
                        self.label.text = newTaskTitle
                        self.dayCount = Int(newTaskTitle)!
                        self.currentArrayEquipment = self.createValues(item: self.dataEquipmentLosses[self.dayCount - 2])
                        self.currentArrayPersonnel = self.createValuesPersonnel(item: self.dataPersonnelLosses[self.dayCount - 2])
                        self.tableView.reloadData()
                    }
                }
        }
        okAction.isEnabled = false
        addOkButton = okAction
        ac.addAction(cancelAction)
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
    
    @objc func checkNumbers(notification: NSNotification) {
        let textField = notification.object as! UITextField
        addOkButton!.isEnabled = textField.text!.utf16.count >= 1
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
