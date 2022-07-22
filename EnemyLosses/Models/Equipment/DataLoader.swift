//
//  DataLoader.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

public class DataLoader {
    
    var equipmentLosses = [EquipmentLosses]()
    
    init() {
        load()
    }
    
    func load() {
        
        guard let url =  URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else { return }
        
        do {
            let urltoString = try String(contentsOf: url)
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
