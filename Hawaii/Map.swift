//
//  Map.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 3/11/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import MapKit


class Map {
    class func setupMapView(sender: Islands) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        
        mapView.tag = IslandAssets.mapViewTag.rawValue
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: sender.coord(), span: span)
        
        mapView.region = region
        return mapView
    }
}
