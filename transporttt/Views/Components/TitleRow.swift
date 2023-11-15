//
//  TitleRow.swift
//  transporttt
//
//  Created by haffa dhifi on 15/11/2023.
//

import SwiftUI
struct TitleRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Imen Ben Atig"
    var body: some View {
        HStack(spacing : 10){
            AsyncImage(url: imageUrl){
                image in image.resizable().aspectRatio(contentMode: .fill).frame(width:50,height: 50).cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name).font(.title).bold()
                Text("Online").font(.caption).foregroundColor(.blue)
                
            }.frame(maxWidth: .infinity,alignment: .leading)
            Image(systemName: "phone.fill").foregroundColor(.blue).padding(10).background(.white).cornerRadius(50)
        }.padding()
       
        
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow().background(Color.blue.opacity(0.25))
    }
}
