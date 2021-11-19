//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/18.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // 在 app 中加入 Model Object，使其在设备上运行时可用
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
