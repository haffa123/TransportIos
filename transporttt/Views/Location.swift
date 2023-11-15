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
                RideRequestView()
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
