//
//  ProfileHost.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/25.
//

import SwiftUI

struct ProfileHost: View {
    // 标识视图是否可编辑
    // 使用 @Environment 进行修饰的属性，SwiftUI 都可代为存储
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    if #available(iOS 15.0, *) {
                        Button("Cancel", role: .cancel) {
                            // 取消之后，复原初始状态
                            draftProfile = modelData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    } else {
                        // Fallback on earlier versions
                        Button("Cancel") {
                            draftProfile = modelData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    }
                }
                Spacer()
                // 控制 editMode 值，在 SwiftUI 中，EditButton 天生就能控制 editMode 的值（仅限于当前编辑区域）
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        // 页面展示时，获取真实数据
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        // 页面消失时，替换修改后的数据
                        modelData.profile = draftProfile
                    }
            }
        }
        // 使 spacing 生效
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
