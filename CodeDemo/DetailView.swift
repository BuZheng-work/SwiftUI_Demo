//
//  Detail.swift
//  CodeDemo
//
//  Created by isonmal on 2019/7/11.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI
import MapKit
struct DetailView <Data>: View where Data: Item{
    var item: Data
    var body: some View {
        MapView()
            .navigationBarTitle("地图")
    
    }
}

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userLocation.title  = "我的位置"
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("=updateUIView")
    }
    
    // 返回UIKit中的 时间协调器 如 delegate target/action
    func makeCoordinator() -> Coordinator {
       return Coordinator()
    }
}

class Coordinator: NSObject {
    
}
extension Coordinator: MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("结束加载地图")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("mapViewWillStartLoadingMap===============")
    }
}

