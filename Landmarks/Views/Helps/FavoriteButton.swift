//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

import SwiftUI

struct FavoriteButton: View {
    // @Binding，将内部更改传到数据源
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            // toggle 变换布尔值
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
            // 只显示图片
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
