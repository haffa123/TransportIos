//
//  Location.swift
//  transporttt
//
//  Created by haffa dhifi on 5/11/2023.
//

import SwiftUI
struct Location: View {
    
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    //let locationManager = MyLocationManager.shared
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top) {
                EcoVenturaMapRes(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView( mapState: $mapState)
                } else if mapState == .noInput  {
                    LocationSearchActivatingView()
                        .padding(.top, 4)
                        .padding(.trailing, -70)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState)
                   
                  

                    .padding(.top, 4)
            }.navigationBarBackButtonHidden(true)
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView(mapState: $mapState)
                    .transition(.move(edge: .bottom))
            }
            if mapState == .confirmed {
                RideFollowView(mapState: $mapState)
                    .transition(.move(edge: .bottom))
            }
            if mapState == .confirmedTaxi {
                DriverListView(drivers: [
                    DriverModel(id: 1, name: "haffa", location: "location 1", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi)
                ])
                .transition(.move(edge: .bottom))

            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation){ location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        }
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
       Location()
    }
}
