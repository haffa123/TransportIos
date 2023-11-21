//
//  RideFollowView.swift
//  transporttt
//
//  Created by haffa dhifi on 11/11/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct RideFollowView: View {
    @State private var selectedRideType: RideType = .Ecar
    @State private var showStationsView :Bool=false
    //@State private var rideType: String = ""
    @State private var showDriverListView :Bool=false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @State var selectedLocation : TaxiLocation = TaxiLocation(title: "INIT", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    @StateObject var stationViewModel : StationViewModel = StationViewModel()
    @Binding var mapState : MapViewState

    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            //trip info view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                }
                VStack(alignment: .leading, spacing:  24){
                    HStack{
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        Text(locationViewModel.pickupTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        if let locaton = locationViewModel.selectedTaxiLocation{
                            Text(locaton.title)
                                .font(.system(size: 16, weight: .semibold))
                            
                        }
                        
                        Spacer()
                        Text(locationViewModel.dropOfTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            //cancel ride button
            Button {
                mapState = .noInput
            }
        label: {
            Text("Cancel")
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(16)
    
        }
    }
