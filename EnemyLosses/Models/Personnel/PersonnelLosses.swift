//
//  PersonnelLosses.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

struct PersonnelLosses: Codable {
    
    static let PersonnelLossesArray = ["Date", "Day", "Personnel", "Prisoner of War"]

    
    var date:  String
    
    var day: Int
    var personnel: Int
    var pow: Int
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case personnel = "personnel"
        case pow = "POW"
    }
    
    static func changeDateFormat(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
}

extension PersonnelLosses {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""

        if let theDay = try? values.decode(String.self, forKey: .day),
            let dayValue = Int(theDay) {
            day = dayValue
        } else {
            day = try values.decode(Int.self, forKey: .day)
        }
        personnel = try values.decodeIfPresent(Int.self, forKey: .personnel)  ?? 0
        pow = try values.decodeIfPresent(Int.self, forKey: .pow)  ?? 0
    }
}

