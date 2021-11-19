//
//  ContentView.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // 将 Model Object 加入 environment，预览时使其在任何子视图中都可使用
            .environmentObject(ModelData())
    }
}
