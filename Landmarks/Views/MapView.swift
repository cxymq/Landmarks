//
//  MapView.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/18.
//

// map 在 preview 时可能会不定位到具体地址，没关系，正式运行就可以显示了

import SwiftUI
import MapKit

// 修饰符 @State https://jaredsinclair.com/2020/05/07/swiftui-cheat-sheet.html#:~:text=Use%20%40State%20when%20your%20view,ancestor%20has%20a%20reference%20to.

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 31.2304, longitude: 121.4737))
    }
}
