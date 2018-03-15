//
//  Map.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 3/11/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import MapKit

var isWifiConnected = false

class Map {
    
     var mapView: MKMapView?
    
     func setupMapView(sender: SenderTuple) -> MKMapView? {
        if !isWifiConnected {
            let title = "Missing WiFi"
            let msg = "The internet is required."
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: nil))
            sender.vc.present(alert, animated: true, completion: nil)
            return nil
        }
        let coord = sender.island.coord()
        
        mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView?.delegate = sender.vc as? MKMapViewDelegate
        
        mapView?.tag = IslandAssets.mapViewTag.rawValue
        
        let span = MKCoordinateSpan(latitudeDelta: 1.30, longitudeDelta: 1.34)
        let region = MKCoordinateRegion(center:coord, span: span)
        
        mapView?.region = region
        return mapView
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func addAnnotations() {
        let one = MKPointAnnotation()
        
        one.coordinate = CLLocationCoordinate2DMake(22.228949, -159.487187)
        one.title = "Queen's Bath";
        one.subtitle = "Fantastic Surffing!";
        
        let two = MKPointAnnotation()
        two.coordinate = CLLocationCoordinate2DMake(22.1692, -159.382565)
        two.title = "Rock Quarry"
        two.subtitle = "Right Waves over Reef"
        
        
        let three = MKPointAnnotation()
        three.coordinate = CLLocationCoordinate2DMake(22.042189, -159.333386)
        three.title = "Black Rock"
        three.subtitle = "Right & Left Waves over Reef"
        
        let four = MKPointAnnotation()
        four.coordinate = CLLocationCoordinate2DMake(22.214516, -159.500867)
        four.title = "Hanalei (Impossibles and the Bowl)"
        four.subtitle = "Beginners, Packed"
        
        let annotations:[MKAnnotation] = [one, two, three, four]
        
        mapView?.addAnnotations(annotations)
        mapView?.setNeedsDisplay()
    }
}

// ===================================================================================================

extension KauaiViewController: MKMapViewDelegate {
    
    
    func mapViewDidFailLoadingMap(_: MKMapView, withError: Error) {
        let title = "Unable to Load Map"
        let msg = "The internet is required."
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// ===================================================================================================

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


