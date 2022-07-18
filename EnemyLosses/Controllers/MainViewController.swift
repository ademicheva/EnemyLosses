//
//  MainViewController.swift
//  EnemyLosses
//
//  Created by Алина on 18.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var totalLossesButton: UIButton!
    @IBOutlet weak var lossesByDayButton: UIButton!
    @IBOutlet weak var detailedLosses: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLossesButton.layer.borderWidth = 6
        totalLossesButton.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        totalLossesButton.layer.cornerRadius = 15
        
        lossesByDayButton.layer.borderWidth = 6
        lossesByDayButton.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        lossesByDayButton.layer.cornerRadius = 15
        
        
        detailedLosses.layer.borderWidth = 6
        detailedLosses.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        detailedLosses.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
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
