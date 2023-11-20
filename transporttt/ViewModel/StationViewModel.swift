
import Foundation
import SwiftUI

class StationViewModel: ObservableObject {
    
    @Published var stations: [Station] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""
    @Published var fromStation: Station = Station(title: "INIT", coordinates: Cordinates(lan: 0, lat: 0))

    
    
    func fetchStation(fromLocation: Cordinates, toLocation: Cordinates) {
        Stationservice().fetchStation(fromLocation: fromLocation, toLocation: toLocation){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    self.isLoading = false
                    self.stations = [data?.fromStation ?? Station(title: "INIT", coordinates: Cordinates(lan: 0, lat: 0))]
                    self.fromStation = data?.fromStation ?? Station(title: "INIT", coordinates: Cordinates(lan: 0, lat: 0))
                    print("DATAA\(self.fromStation)")
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
