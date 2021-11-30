//
//  Landmark.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/18.
//

import Foundation
import SwiftUI
import CoreLocation

// Hashable（用于 hash 属性值进行比较是否相等） Codable（用于匹配变量和 JSON 值） 作用 https://dudd.tistory.com/63
struct LandMark: Hashable, Codable, Identifiable {
    // 属性名称要和 json 一致，否则导致解析失败
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    // 类别
    var category: Category
    // CaseIterable 通常用于无关联的枚举值，可以用 allCases 获取所有的值
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude
        )
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
