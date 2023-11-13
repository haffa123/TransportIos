//
//  RideType.swift
//  transporttt
//
//  Created by haffa dhifi on 12/11/2023.
//

import Foundation


enum RideType: Int, CaseIterable, Identifiable{
    case Ecar
    case Taxi
    case Ebike
    case Bus
    var id: Int { return rawValue}
    
    var description: String {
        switch self {
        case .Ecar: return "Ecar"
        case .Taxi: return "Taxi"
        case .Ebike: return "Ebike"
        case .Bus: return "Bus"

        }
    }
    var imageName: String {
        switch self {
        case .Ecar: return "Ecar"
        case .Taxi: return "Taxi"
        case .Ebike: return "Ebike"
        case .Bus: return "Bus"
        }
    }
    var baseFare: Double{
        switch self {
        case .Ecar: return 100
        case .Taxi: return 20
        case .Ebike: return 5
        case .Bus: return 7
        }
    }
    func computePrice(for distanceInMeters: Double) -> Double{
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .Ecar: return distanceInMiles * 1.5 + baseFare
        case .Taxi: return distanceInMiles * 2.0 + baseFare
        case .Ebike: return distanceInMiles * 1.0 + baseFare
        case .Bus: return distanceInMiles * 1.2 + baseFare
    
        }
    }
}
