//
//  Profile.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/25.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var goalDate = Date()
    var seasonalPhoto = Season.winter
    
    // 设置默认值
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        var id: String {
            rawValue
        }
        
        case spring =  "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
