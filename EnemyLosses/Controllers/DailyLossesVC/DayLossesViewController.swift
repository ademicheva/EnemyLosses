//
//  DayLossesViewController.swift
//  EnemyLosses
//
//  Created by Алина on 20.07.2022.
//

import UIKit
    
class DayLossesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dataEquipmentLosses: [EquipmentLosses] = []
    var dataPersonnelLosses: [PersonnelLosses] = []
    
    var selectedEquipment: String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = selectedEquipment
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEquipmentLosses.count - 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DayLossesTableViewCell
        cell.backgroundView = nil
        cell.cellView.layer.cornerRadius = 10

        cell.cellView.layer.borderWidth = 2
        cell.cellView.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.6)
        cell.backgroundColor = nil
        cell.dateLabel.text = PersonnelLosses.changeDateFormat(date: dataEquipmentLosses[indexPath.row].date)
        cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].aircraft)
        
        switch selectedEquipment{
        case "Personnel":
            cell.quantityLabel.text = String(dataPersonnelLosses[indexPath.row].personnel)
            image.image = UIImage(named: "Personnel")
        case "Prisoners of War":
            cell.quantityLabel.text = String(dataPersonnelLosses[indexPath.row].pow)
            image.image = UIImage(named: "Prisoners of War")
        case "Aircraft":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].aircraft)
            image.image = UIImage(named: "Aircraft")
        case "Helicopter":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].helicopter)
            image.image = UIImage(named: "Helicopter")
        case "Tank":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].tank)
            image.image = UIImage(named: "Tank")
        case "APC":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].APC)
            image.image = UIImage(named: "APC")
        case "Field artillery":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].fieldArtillery)
            image.image = UIImage(named: "Field artillery")
        case "MRL":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].MRL)
            image.image = UIImage(named: "MRL")
        case "Military auto":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].militaryAuto)
            image.image = UIImage(named: "Military auto")
        case "Fuel tank":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].fuelTank)
            image.image = UIImage(named: "Fuel tank")
        case "Drone":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].drone)
            image.image = UIImage(named: "Drone")
        case "Naval ship":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].navalShip)
            image.image = UIImage(named: "Naval ship")
        case "Anti-aircraft warfare":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].antiAircraftWarfare)
            image.image = UIImage(named: "Anti-aircraft warfare")
        case "Special equipment":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].specialEquipment)
            image.image = UIImage(named: "Special equipment")
        case "Mobile SRBM system":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].mobileSRBMSystem)
            image.image = UIImage(named: "Mobile SRBM system")
        case "Vehicles and fuel tanks":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].vehiclesAndFuelTanks)
            image.image = UIImage(named: "Vehicles and fuel tanks")
        case "Cruise missiles":
            cell.quantityLabel.text = String(dataEquipmentLosses[indexPath.row].cruiseMissiles)
            image.image = UIImage(named: "Cruise missiles")
        default:
            break
        }
        return cell
    }
}
