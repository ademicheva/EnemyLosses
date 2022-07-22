//
//  DataLoader.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation


public class DataLoaderPersonnel {
    var personnelLosses = [PersonnelLosses]()
    
    init() {
        load()
    }
    
    func load() {
        
        let path = Bundle.main.url(forResource: "russia_losses_personnel", withExtension: "json")!
        
        do {
            let urltoString = try String(contentsOf: path)
            let correctJSONString = urltoString.replacingOccurrences(of: "NaN", with: "null")
            guard let jsonData = correctJSONString.data(using: .utf8) else { return  }
            let jsonDecoder = JSONDecoder()
            let dataPersonnelFromJSON = try jsonDecoder.decode([PersonnelLosses].self, from: jsonData)
            self.personnelLosses = dataPersonnelFromJSON
        } catch {
            print(error)
        }
    }
}
