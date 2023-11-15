//
//  DriverDetailsView.swift
//  transporttt
//
//  Created by haffa dhifi on 14/11/2023.
//

import SwiftUI

struct DriverDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isChatViewPresented = false
    @State private var navigateToRatingView = false
    var driverInfo: DriverModel
  
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Image("driver_image") // Replace with the actual image name or URL
                        .resizable()
                        .cornerRadius(32)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .padding(.top, 20)
                  
                    HStack {
                        Text(driverInfo.name)
                            .font(.title)
                            .padding(.top, 16)
                        
                        Spacer()
                        
                       
                            NavigationLink(destination: RatingView(), isActive: $navigateToRatingView) {
                            
                            }

                                .hidden()
                           
                            Button(action: {
                                navigateToRatingView = true
                                
                            })
                            {
                                Text(" Rate Driver")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .padding(.top, 16)
                            
                            }
                            
                        }
                    HStack() {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .foregroundColor(.gray)
                            .padding(.bottom, 1)
                        Text(driverInfo.reviews)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                     
                            .frame(width: 70, height: 70)
                            .cornerRadius(15)
                        Spacer()
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.gray)
                    }
                    
                    Text(driverInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                   
                    Text(driverInfo.description)
                        Spacer()

                    HStack {
                        Button("Chat") {
                            // Action to start a chat
                            isChatViewPresented.toggle()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)

                        Spacer()
                        
                        Color("355E3B")
                            .frame(width: 70, height: 70)
                            .cornerRadius(15)
                            .sheet(isPresented: $isChatViewPresented) {
                                                        ContentChatView()
                                                    }
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.gray)
                    }
                }
                .padding(.horizontal, 15)
            }
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal, 16)
            .padding(.top, -10)
            .navigationBarTitle("driver info", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
          
        }
    }
}

struct DriverDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailsView(driverInfo: DriverModel(
            id: 1,
            name: "Driver Driver",
            location: "Tunis, Tunisie",
            imageName: "driver_image",
            description: "Passionate and dedicated taxi driver with a commitment to providing safe and comfortable rides. Known for excellent navigation skills, courteous service, and a friendly demeanor. Always prioritizing passenger satisfaction. ",
            reviews: "5",
            rideType: .Taxi
        ))
    }
}
