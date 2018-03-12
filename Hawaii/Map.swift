//
//  Map.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 3/11/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import MapKit

extension HawaiiViewController: MKMapViewDelegate {
    func setupMapView() -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        
        mapView.tag = IslandAssets.mapViewTag.rawValue
        
        let coord = CLLocationCoordinate2DMake(19.7297222, -155.09000000000003)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coord, span: span)
        
        mapView.region = region
        return mapView
    }
}

extension KauaiViewController: MKMapViewDelegate {
    func setupMapView() -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.tag = IslandAssets.mapViewTag.rawValue
        let coord = CLLocationCoordinate2DMake(19.7297222, -155.09000000000003)
        let span = MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        let region = MKCoordinateRegion(center: coord, span: span)
        
        mapView.region = region
        return mapView
    }
}

