//
//  EquipmentLosses.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

struct EquipmentLosses: Codable {
    
    static let EquipmentDetail = ["Personnel", "Prisoners of War", "Aircraft", "Helicopter", "Tank", "APC", "Field artillery", "MRL", "Military auto", "Fuel tank", "Drone", "Naval ship", "Anti-aircraft warfare", "Special equipment", "Mobile SRBM system", "Vehicles and fuel tanks", "Cruise missiles"]
    
    static let EquipmentLossesArray = ["Date", "Day", "Aircraft", "Helicopter", "Tank", "APC", "Field artillery", "MRL", "Military auto", "Fuel tank", "Drone", "Naval ship", "Anti-aircraft warfare", "Special equipment", "Mobile SRBM system", "Vehicles and fuel tanks", "Cruise missiles", "Greatest losses direction"]
    
    var date: String
    var day: Int
    var aircraft: Int
    var helicopter: Int
    var tank: Int
    var APC: Int
    var fieldArtillery: Int
    var MRL: Int
    var militaryAuto: Int
    var fuelTank: Int
    var drone: Int
    var navalShip: Int
    var antiAircraftWarfare: Int
    var specialEquipment: Int
    var mobileSRBMSystem: Int
    var vehiclesAndFuelTanks: Int
    var cruiseMissiles: Int
    var greatestLossesDirection: String
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case aircraft = "aircraft"
        case helicopter = "helicopter"
        case tank = "tank"
        case APC = "APC"
        case fieldArtillery = "field artillery"
        case MRL = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone = "drone"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }
      func changeDateFormat(dateInt: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
}

extension EquipmentLosses {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""
        if let theDay = try? values.decode(String.self, forKey: .day),
            let dayValue = Int(theDay) {
            day = dayValue
        } else {
            day = try values.decode(Int.self, forKey: .day)
        }
        helicopter = try values.decodeIfPresent(Int.self, forKey: .helicopter)  ?? 0

        if let theAircraft = try? values.decode(String.self, forKey: .aircraft),
            let aircraftValue = Int(theAircraft) {
            aircraft = aircraftValue
        } else {
            aircraft = try values.decode(Int.self, forKey: .aircraft)
        }
        tank = try values.decodeIfPresent(Int.self, forKey: .tank)  ?? 0
        APC = try values.decodeIfPresent(Int.self, forKey: .APC)  ?? 0
        fieldArtillery = try values.decodeIfPresent(Int.self, forKey: .fieldArtillery)  ?? 0
        MRL = try values.decodeIfPresent(Int.self, forKey: .MRL)  ?? 0
        militaryAuto = try values.decodeIfPresent(Int.self, forKey: .militaryAuto)  ?? 0
        fuelTank = try values.decodeIfPresent(Int.self, forKey: .fuelTank)  ?? 0
        drone = try values.decodeIfPresent(Int.self, forKey: .drone)  ?? 0
        navalShip = try values.decodeIfPresent(Int.self, forKey: .navalShip)  ?? 0

        antiAircraftWarfare = try values.decodeIfPresent(Int.self, forKey: .antiAircraftWarfare)  ?? 0
        specialEquipment = try values.decodeIfPresent(Int.self, forKey: .specialEquipment)  ?? 0
        mobileSRBMSystem = try values.decodeIfPresent(Int.self, forKey: .mobileSRBMSystem)  ?? 0
        vehiclesAndFuelTanks = try values.decodeIfPresent(Int.self, forKey: .vehiclesAndFuelTanks)  ?? 0
        cruiseMissiles = try values.decodeIfPresent(Int.self, forKey: .cruiseMissiles)  ?? 0
        greatestLossesDirection = try values.decodeIfPresent(String.self, forKey: .greatestLossesDirection)  ?? "No info"
        
    }
}
