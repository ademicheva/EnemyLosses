//
//  DataLoader.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

//enum LossesValue: String {
//    case equipment = "russia_losses_equipment"
//    case personnel = "russia_losses_personnel"
//}

public class DataLoader {
    
    var equipmentLosses = [EquipmentLosses]()
    
    init() {
        load()
    }
    
    func load() {
        
        let path = Bundle.main.url(forResource: "russia_losses_equipment", withExtension: "json")!
        
        do {
            let urltoString = try String(contentsOf: path)
            let correctJSONString = urltoString.replacingOccurrences(of: "NaN", with: "null")
            guard let jsonData = correctJSONString.data(using: .utf8) else { return  }
            let jsonDecoder = JSONDecoder()
            let dataFromJSON = try jsonDecoder.decode([EquipmentLosses].self, from: jsonData)
            self.equipmentLosses = dataFromJSON
        } catch {
            print(error)
        }
    }
}
