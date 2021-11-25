//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            // 用户名
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            // 通知开关
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
                    .bold()
            }
            
            // 季节选择器
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) {season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            // 日期选择器
            DatePicker(selection: $profile.goalDate, in: dataRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
