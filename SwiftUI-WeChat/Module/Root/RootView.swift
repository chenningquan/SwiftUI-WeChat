//
//  RootView.swift
//  SwiftUI-WeChat
//
//  Created by chennq on 2022/11/18.
//

import SwiftUI

struct RootView: View {
    @State private var selection: Int = 0
    
    private var itemType: tabbar_item_type { tabbar_item_type(rawValue: selection)! }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ChatHome()
                    .tabItem {
                        Item(type: .chat, selection: selection)
                    }
                    .tag(tabbar_item_type.chat.rawValue)
                ContactHome()
                    .tabItem {
                        Item(type: .contact, selection: selection)
                    }
                    .tag(tabbar_item_type.contact.rawValue)
                DiscoverHome()
                    .tabItem {
                        Item(type: .discover, selection: selection)
                    }
                    .tag(tabbar_item_type.discover.rawValue)
                MeHome()
                    .tabItem {
                        Item(type: .me, selection: selection)
                    }
                    .tag(tabbar_item_type.me.rawValue)
            }
            .accentColor(.blue)
            .navigationBarHidden(itemType.shouldShowNavigation(selection: selection))
            .navigationBarTitle(Text(itemType.title), displayMode: .inline)
            .navigationBarItems(trailing: itemType.navigationBarTrailingItems(selection: selection))
        }
    }
    
    enum tabbar_item_type: Int {
        case chat
        case contact
        case discover
        case me
        
        var image: Image {
            switch self {
                case .chat: return Image("root_tab_chat")
                case .contact: return Image("root_tab_contact")
                case .discover: return Image("root_tab_discover")
                case .me: return Image("root_tab_me")
            }
        }
        
        var selectImage: Image {
            switch self {
                case .chat: return Image("root_tab_chat_selected")
                case .contact: return Image("root_tab_contact_selected")
                case .discover: return Image("root_tab_discover_selected")
                case .me: return Image("root_tab_me_selected")
            }
        }
        
        var title: String {
            switch self {
                case .chat:     return "微信"
                case .contact:  return "通讯录"
                case .discover: return "发现"
                case .me:       return "我"
            }
        }
        
        func shouldShowNavigation(selection: Int) -> Bool {
            selection == tabbar_item_type.me.rawValue
        }
        
        func navigationBarTrailingItems(selection: Int) -> AnyView {
            switch tabbar_item_type(rawValue: selection)! {
            case .chat: return AnyView(Image(systemName: "plus.circle"))
            case .contact: return AnyView(Image(systemName: "person.badge.plus"))
            case .discover: return AnyView(EmptyView())
            case .me: return AnyView(EmptyView())
            }
        }
    }
    
    struct Item: View {
        let type: tabbar_item_type
        let selection: Int
        
        var body: some View {
            VStack {
                if selection == type.rawValue {
                    type.selectImage
                        .renderingMode(.template)
                        .tint(.blue)
                } else {
                    type.image
                }
                Text(type.title)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
