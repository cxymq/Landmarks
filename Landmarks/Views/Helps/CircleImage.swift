//
//  CircleImage.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/18.
//

// 若 Image 首次加 clipShape 时不起作用，增加 .resizable() 立刻生效，移除 resizable 之后依然有效（可能是 previews bug）


import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        if #available(iOS 15.0, *) {
            image
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("head"))
    }
}
