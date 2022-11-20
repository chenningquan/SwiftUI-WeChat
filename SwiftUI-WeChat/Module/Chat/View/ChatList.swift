//
//  ChatList.swift
//  SwiftUI-WeChat
//
//  Created by chennq on 2022/11/18.
//

import SwiftUI

struct ChatList: View {
    @State private var chats: [Chat] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatView(), label: {
                        ChatRow(chat: chat)
                    })
                }
            }
            .background(Color("cell"))
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard chats.isEmpty else { return }
        chats = Chat.all
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
