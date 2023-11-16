
import Foundation
import SwiftUI

class StationViewModel: ObservableObject {
    
    @Published var stations: [Station] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""

    
    
    func fetchStations() {
        Stationservice().fetchStations(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.stations = data?.stations ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
