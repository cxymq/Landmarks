//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/19.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LandMark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

// 如果预览 error，确认加载时 json 文件名是否有问题
struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
            .previewLayout(.fixed(width: 375, height: 70))
    }
}
