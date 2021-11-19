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
struct LandMark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image{
        Image(imageName)
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