//
//  LocationSearchActivatingView.swift
//  transporttt
//
//  Created by haffa dhifi on 7/11/2023.
//

import SwiftUI

struct LocationSearchActivatingView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Whre to go?")
                .foregroundColor(Color(.darkGray))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 90,
               height: 50)
        .background(
        Rectangle()
            .fill(Color.white)
            .shadow(color: .black, radius: 6))
             .cornerRadius(25)
             .shadow(color: .blue, radius: 6)
    }
}

struct LocationSearchActivatingView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivatingView()
    }
}
