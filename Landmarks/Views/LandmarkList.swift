//
//  LandmarkList.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            // List 只在拥有可识别数据上使用
            // 这里 id 作为数据唯一标识,当然使用另一种方法可以移除 id，但是 LandMark 数据模型必须遵守 Identifiable 协议
            // 反斜杠：添加引用身份密钥路径的功能，该身份密钥路径引用了应用于该身份密钥路径的整个输入值（感觉相当于 landmark）。
            // https://developer.apple.com/documentation/swiftui/list
            List(landmarks, id: \.id) { landmark in
                // 跳转
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
