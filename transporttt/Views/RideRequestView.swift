//
//  RideRequestView.swift
//  transporttt
//
//  Created by haffa dhifi on 11/11/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .Ecar
    @State private var showStationsView :Bool=false
    //@State private var rideType: String = ""
    @State private var showDriverListView :Bool=false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
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
                                .foregroundColor(.blue)
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
            
            //ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(RideType.allCases){ type in
                        VStack(alignment: .leading){
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding()
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.0 : 0.95)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()){
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            //payment methde view
            HStack(spacing: 12){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("*********212")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            //request ride button
            Button {
                print("MAPSTATE: \(mapState)")
                if selectedRideType == .Ebike || selectedRideType == .Bus {
                    let location = locationViewModel.selectedTaxiLocation ?? TaxiLocation(title: "INIT", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
                    locationViewModel.setSelectedLocation(location: location)
                    stationViewModel.fetchStation(fromLocation: Cordinates(lan: locationViewModel.userLocation?.longitude ?? 0, lat: locationViewModel.userLocation?.latitude ?? 0), toLocation: Cordinates(lan: locationViewModel.selectedTaxiLocation?.coordinate.longitude ?? 0, lat: locationViewModel.selectedTaxiLocation?.coordinate.latitude ?? 0))
                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                        print("DATAA>>>>>>>>\(stationViewModel.fromStation)")
                        let location = TaxiLocation(title: stationViewModel.fromStation.title, coordinate: CLLocationCoordinate2D(latitude: stationViewModel.fromStation.coordinates.lat , longitude: stationViewModel.fromStation.coordinates.lan ))
                            locationViewModel.setLocation(location: location)
                            mapState = .busSelected
                            
                        })
                }
                else if
                    selectedRideType == .Ecar || selectedRideType == .Taxi {
                    let location = locationViewModel.selectedLocation ?? locationViewModel.selectedTaxiLocation ?? TaxiLocation(title: "INIT", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0) )
                    locationViewModel.setLocation(location: location)
                    mapState = .locationSelected
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        showDriverListView.toggle()
                    })
                }
                
                print("MAPSTATE222: \(mapState)")

            }
        label: {
            Text("CONFIRM")
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
        .sheet(isPresented: $showDriverListView) {
            DriverListView(drivers: [
                DriverModel(id: 1, name: "haffa", location: "location 1", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .Taxi)
            ])
        }
        /*.sheet(isPresented: $showDriverListView){
            RideFollowView(stationViewModel: stationViewModel, mapState: $mapState)
        }*/
        
    
        }
    }
