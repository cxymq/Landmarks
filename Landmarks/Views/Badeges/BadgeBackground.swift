//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/22.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        // GeometryReader https://juejin.cn/post/6844904004133060615
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let xScale: CGFloat = 0.832
                // X 坐标偏移量，使其居中
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint (
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            // 线性渐变色
            // https://learnappmaking.com/self-swift-how-to/
            // "self" 当前实例的引用（refers to the current instance, in the body of one of its methods.）
            // "Self"，感觉是类本身或者实现协议的类本身（is a placeholder used in two different cases:
            // 1. In a protocol, it refers to the type that conforms to the protocol in any particular use. In Equatable, for example, it's used to require that the two values being compared are of the same type. It's something like a generic type parameter that you don't have to put between the <…> because it's deduced from the context of its use.
            // 2. In a class/static method, it can be used as the return type, to indicate that the return type is the type of the class to which the method was sent, rather than the class in which the method is declared. It's similar to 'instancetype' in Obj-C.）
            .fill(.linearGradient(colors: [Self.gradientStart, Self.gradientEnd], startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }
        // 设置 GeometryReader 宽高比是 1
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
