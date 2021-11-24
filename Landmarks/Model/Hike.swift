//
//  Hike.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/23.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    // LengthFormatter 长度数据格式化
    static var formatter = LengthFormatter()

    // 将 distance 格式化成公里
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
