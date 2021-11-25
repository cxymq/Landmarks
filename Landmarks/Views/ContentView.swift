//
//  ContentView.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView {
            CategoryHome()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
            // 为 view 设置独一无二的标识
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // 将 Model Object 加入 environment，预览时使其在任何子视图中都可使用
            .environmentObject(ModelData())
    }
}
