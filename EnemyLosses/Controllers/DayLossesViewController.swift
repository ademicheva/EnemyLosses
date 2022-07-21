//
//  DayLossesViewController.swift
//  EnemyLosses
//
//  Created by Алина on 20.07.2022.
//

import UIKit

class DayLossesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let dataEquipment2 = DataLoader(lossesValue: LossesValue.equipment).equipmentLosses
    let dataPersonnel2 = DataLoaderPersonnel().personnelLosses
    var items : [EquipmentDetail] = []
    var selectedEquipment: String = ""
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedEquipment)
        label.text = selectedEquipment

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEquipment2.count - 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DayLossesTableViewCell
        cell.backgroundView = nil
        cell.cellView.layer.cornerRadius = 10

        cell.cellView.layer.borderWidth = 5
        cell.cellView.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.6)
        cell.backgroundColor = nil
        cell.dateLabel.text = dataEquipment2[indexPath.row].date
        cell.quantityLabel.text = String(dataEquipment2[indexPath.row].aircraft)
        
        switch selectedEquipment{
            
        case "Personnel":
            cell.quantityLabel.text = String(dataPersonnel2[indexPath.row].personnel)
        case "Prisoners of War":
            cell.quantityLabel.text = String(dataPersonnel2[indexPath.row].pow)
            
        case "Aircraft":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].aircraft)
        case "Helicopter":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].helicopter)
        case "Tank":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].tank)
            
        case "APC":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].APC)
        case "Field artillery":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].fieldArtillery)
        case "MRL":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].MRL)
        
        case "Military auto":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].militaryAuto)
        case "Fuel tank":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].fuelTank)
        case "Drone":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].drone)
            

        case "Naval ship":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].navalShip)
        case "Anti-aircraft warfare":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].antiAircraftWarfare)
            
        case "Special equipment":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].specialEquipment)
        case "Mobile SRBM system":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].mobileSRBMSystem)
            
        case "Vehicles and fuel tanks":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].vehiclesAndFuelTanks)
        case "Cruise missiles":
            cell.quantityLabel.text = String(dataEquipment2[indexPath.row].cruiseMissiles)
            
        default:
            break
        }


        return cell
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
