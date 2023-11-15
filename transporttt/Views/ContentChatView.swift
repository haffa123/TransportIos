//
//  ContentChatView.swift
//  transporttt
//
//  Created by haffa dhifi on 15/11/2023.
//

import SwiftUI


struct ContentChatView: View {
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
                    //.cornerRadius(30, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
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

struct ContentChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentChatView()
    }
}
