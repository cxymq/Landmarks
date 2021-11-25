//
//  HikeBadge.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/25.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack {
//            Badge()
//                .frame(width: 100, height: 100)
            // 要设置的足够大才能正常显示，然后再按比例缩小
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Test")
    }
}
