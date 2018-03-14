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
        
        let span = MKCoordinateSpan(latitudeDelta: 1.30, longitudeDelta: 1.34)
        let region = MKCoordinateRegion(center: sender.coord(), span: span)
        
        mapView.region = region
        return mapView
    }
}

// ===================================================================================================

extension KauaiViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        return
    }
}

extension OahuViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        return
    }
}

extension MolokaiViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        return
    }
}

extension MauiViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        return
    }
}


extension HawaiiViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        return
    }
}


