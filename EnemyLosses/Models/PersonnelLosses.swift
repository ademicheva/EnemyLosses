//
//  PersonnelLosses.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

struct PersonnelLosses: Codable {
    var date: String
    var day: Int
    var personnel: Int
    var pow: Int
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case personnel = "personnel"
        case pow = "POW"
    }
}
