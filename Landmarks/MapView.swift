//
//  MapView.swift
//  Landmarks
//
//  Created by nazimai on 2021/11/18.
//

import SwiftUI
import MapKit

// 修饰符 @State https://jaredsinclair.com/2020/05/07/swiftui-cheat-sheet.html#:~:text=Use%20%40State%20when%20your%20view,ancestor%20has%20a%20reference%20to.

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.2304, longitude: 121.4737), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
