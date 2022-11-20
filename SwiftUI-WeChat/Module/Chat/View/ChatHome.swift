//
//  ChatHome.swift
//  SwiftUI-WeChat
//
//  Created by chennq on 2022/11/18.
//

import SwiftUI

struct ChatHome: View {
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300)
                Spacer()
            }
            ChatList()
        }
    }
}

struct ChatHome_Previews: PreviewProvider {
    static var previews: some View {
        ChatHome()
    }
}
