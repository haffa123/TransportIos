//
//  ChatView.swift
//  transporttt
//
//  Created by haffa dhifi on 15/11/2023.
//

import SwiftUI


struct ChatView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundColor(.clear)
                                .background(
                                    GeometryReader { geometry in
                                        Path { path in
                                            let width = geometry.size.width
                                            let height = geometry.size.height
                                            path.move(to: CGPoint(x: 0, y: 0))
                                            path.addArc(center: CGPoint(x: width, y: 0), radius: 30, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
                                            path.addArc(center: CGPoint(x: width, y: height), radius: 0, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
                                            path.addArc(center: CGPoint(x: 0, y: height), radius: 0, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
                                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 30, startAngle: .degrees(270), endAngle: .degrees(360), clockwise: false)
                                        }
                                        .fill(Color.white)
                                    }
                                )
                        )


 // Custom cornerRadius modifier added in Extensions file
                    .onChange(of: messagesManager.lastMessageId) { id in
                        // When the lastMessageId changes, scroll to the bottom of the conversation
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color.blue.opacity(0.25))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentChatDriverView_Previews: PreviewProvider {
    static var previews: some View {
        ContentChatView()
    }
}

