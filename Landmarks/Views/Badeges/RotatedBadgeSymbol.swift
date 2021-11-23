//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    // Angle 几何旋转，可设置弧度和角度
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
        // 旋转效果，anchor 锚点
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
