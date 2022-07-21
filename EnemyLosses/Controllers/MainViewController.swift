//
//  MainViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    var dataEquipmentLosses: [EquipmentLosses] = []
    var dataPersonnelLosses: [PersonnelLosses] = []

    @IBOutlet weak var lossesByDayButton: UIButton!
    @IBOutlet weak var detailedLosses: UIButton!
    
    let dataEquipment1 = DataLoader(lossesValue: LossesValue.equipment).equipmentLosses
    let dataPersonnel1 = DataLoaderPersonnel().personnelLosses
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataEquipmentLosses = dataEquipment1
        dataPersonnelLosses = dataPersonnel1
     
        lossesByDayButton.layer.borderWidth = 5
        lossesByDayButton.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.6)
        lossesByDayButton.layer.cornerRadius = 15
        
        detailedLosses.layer.borderWidth = 6
        detailedLosses.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.6)
        detailedLosses.layer.cornerRadius = 15

    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            LossesByDayViewController {
            destination.dataEquipmentLosses = dataEquipment1
            destination.dataPersonnelLosses = dataPersonnel1
        }
        if let destination = segue.destination as?
            DetailCollectionViewController {
            destination.dataEquipmentLosses = dataEquipment1
            destination.dataPersonnelLosses = dataPersonnel1
        }
    }
}
