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

extension MKMapView {
    func displayTitleLabel(title: String) {
        let titleLabel: UILabel = {
            let label = UILabel(frame: CGRect.zero)
            label.tag = IslandAssets.mapTitleTag.rawValue
            label.text = title
            label.textColor = UIColor.blue
            label.font = UIFont(name: noteworthyFont, size: 34.0)
            label.textAlignment = .center
            return label
        }()
        
        self.addSubview(titleLabel)
        
        titleLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: nil,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: self.centerXAnchor,
                          paddingTop: 60,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          paddingRight: 0, width: toolbarWidth, height: 44)
        
    }
}

// ===================================================================================================

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
        
        let span:MKCoordinateSpan
        
        if sender.island == .Kauai {
            span = MKCoordinateSpan(latitudeDelta: 0.56, longitudeDelta: 0.56)
        } else {
            span = MKCoordinateSpan(latitudeDelta: 1.30, longitudeDelta: 1.34)
        }
        
        let region = MKCoordinateRegion(center:coord, span: span)
        
        mapView?.region = region
        return mapView
    }
    
    // -----------------------------------------------------------------------------------------------------
    // http://www.surfing-waves.com/atlas/north_america/hawaii/kauai/spot/horners.html
    func addSurfAnnotations(sender: UIViewController) {
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
        
        let five = MKPointAnnotation()
        five.coordinate = CLLocationCoordinate2DMake(22.049938, -159.332446)
        five.title = "Horners"
        five.subtitle = "Rocky Reef; Can get busy."
        
        let six = MKPointAnnotation()
        six.coordinate = CLLocationCoordinate2DMake(22.220000, -159.3)
        six.title = "Kalapaki"
        six.subtitle = "Rocky Reef; for Beginners"
        
        let annotations:[MKAnnotation] = [one, two, three, four, five, six]
        
        mapView?.addAnnotations(annotations)
        mapView?.displayTitleLabel(title: "Surf Sites")
    }
}

// ===================================================================================================

extension KauaiViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        return
    }
    
    // -----------------------------------------------------------------------------------------------------
    
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


