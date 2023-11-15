//
//  DriverListView.swift
//  transporttt
//
//  Created by haffa dhifi on 14/11/2023.
//

import SwiftUI

struct DriverListView: View {
    let drivers: [DriverModel]
    
    var body: some View {
        NavigationView {
            List(drivers, id: \.id) { driver in
                NavigationLink(destination: DriverDetailsView(driverInfo: driver)) {
                    DriverResultCell(driver: driver)
                }
            }
            .navigationBarTitle("Drivers", displayMode: .inline)
     
        }
    }
}

struct DriverListView_Previews: PreviewProvider {
    static var previews: some View {
        DriverListView(drivers: [
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
            DriverModel(id: 1, name: "haffa test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi),
           
        ])
    }
}
