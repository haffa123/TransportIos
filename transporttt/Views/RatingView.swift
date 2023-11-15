//
//  RatingView.swift
//  transporttt
//
//  Created by haffa dhifi on 14/11/2023.
//

import SwiftUI

struct RatingView: View {
    @State private var rating: Int = 4
    @State private var comment: String = ""
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all) // Set blue background
            
            VStack(spacing: 20) { // Make the main VStack longer
                Text("Rating")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .bold()
                
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                        
                        Image(systemName: "person.fill") // Replace with the driver's image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                            .shadow(radius: 5)
                    }
                    
                    Text("Driver's Name") // Replace with the driver's name
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Text("How was your trip?")
                        .font(.headline)
                        .foregroundColor(.black)
                        .bold()
                        .padding(.top, 10)
                    
                    Text("Your feedback will help to improve the driving experience.")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= self.rating ? "star.fill" : "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    self.rating = index
                                }
                        }
                    }
                    .padding(.top, 10)
                    
                    TextField("Write your comment...", text: $comment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        // Add code to submit the review
                    }) {
                        Text("Submit Review")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .frame(width: 300, height: 150)
                    }
                    .padding(.top, 60)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
