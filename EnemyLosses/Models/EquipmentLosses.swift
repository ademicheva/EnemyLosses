//
//  EquipmentLosses.swift
//  EnemyLosses
//
//  Created by Алина on 15.07.2022.
//

import Foundation

struct EquipmentLosses: Codable {
    var date: String?
    var day: Int
    var aircraft: Int
    var helicopter: Int?
    var tank: Int?
    var APC: Int?
    var fieldArtillery: Int?
    var MRL: Int?
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int?
    var navalShip: Int?
    var antiAircraftWarfare: Int?
    var specialEquipment: Int?
    var mobileSRBMSystem: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    var greatestLossesDirection: String?
    
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
}

extension EquipmentLosses {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decodeIfPresent(String.self, forKey: .date)
        
        if let theDay = try? values.decode(String.self, forKey: .day),
            let dayValue = Int(theDay) {
            day = dayValue
        } else {
            day = try values.decode(Int.self, forKey: .day)
        }
        helicopter = try values.decodeIfPresent(Int.self, forKey: .helicopter)

        if let theAircraft = try? values.decode(String.self, forKey: .aircraft),
            let aircraftValue = Int(theAircraft) {
            aircraft = aircraftValue
        } else {
            aircraft = try values.decode(Int.self, forKey: .aircraft)
        }
        tank = try values.decodeIfPresent(Int.self, forKey: .tank)
        APC = try values.decodeIfPresent(Int.self, forKey: .APC)
        fieldArtillery = try values.decodeIfPresent(Int.self, forKey: .fieldArtillery)
        MRL = try values.decodeIfPresent(Int.self, forKey: .MRL)
        militaryAuto = try values.decodeIfPresent(Int.self, forKey: .militaryAuto)
        fuelTank = try values.decodeIfPresent(Int.self, forKey: .fuelTank)
        drone = try values.decodeIfPresent(Int.self, forKey: .drone)
        navalShip = try values.decodeIfPresent(Int.self, forKey: .navalShip)

        antiAircraftWarfare = try values.decodeIfPresent(Int.self, forKey: .antiAircraftWarfare)
        specialEquipment = try values.decodeIfPresent(Int.self, forKey: .specialEquipment)
        mobileSRBMSystem = try values.decodeIfPresent(Int.self, forKey: .mobileSRBMSystem)
        vehiclesAndFuelTanks = try values.decodeIfPresent(Int.self, forKey: .vehiclesAndFuelTanks)
        cruiseMissiles = try values.decodeIfPresent(Int.self, forKey: .cruiseMissiles)
        greatestLossesDirection = try values.decodeIfPresent(String.self, forKey: .greatestLossesDirection)
        
    }
}
