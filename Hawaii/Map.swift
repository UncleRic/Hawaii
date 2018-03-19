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
        
        switch sender.island {
        case .Kauai:
            span = MKCoordinateSpan(latitudeDelta: 0.56, longitudeDelta: 0.56)
        case .Oahu:
            span = MKCoordinateSpan(latitudeDelta: 0.54, longitudeDelta: 0.54)
        case .Molokai:
            span = MKCoordinateSpan(latitudeDelta: 0.61, longitudeDelta: 0.61)
        default:
            span = MKCoordinateSpan(latitudeDelta: 1.30, longitudeDelta: 1.34)
        }
        
        
        let region = MKCoordinateRegion(center:coord, span: span)
        
        mapView?.region = region
        return mapView
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Surfing Annotations
    // http://www.surfing-waves.com/atlas/north_america/hawaii/kauai/spot/horners.html
    // https://www.latlong.net/lat-long-utm.html
    
    // KAUAI
    
    func addKauaiSurfAnnotations(sender: UIViewController) {
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
    
    // -----------------------------------------------------------------------------------------------------
    // Oahu
    
    func addOahuSurfAnnotations(sender: UIViewController) {
        let one = MKPointAnnotation()
        
        one.coordinate = CLLocationCoordinate2DMake(21.461312, -157.760969)
        one.title = "Pyramid Rock";
        one.subtitle = "Point Break, East";
        
        let two = MKPointAnnotation()
        two.coordinate = CLLocationCoordinate2DMake(21.662337, -158.060577)
        two.title = "Off-The-Wall";
        two.subtitle = "Advanced Surfer";
        
        let three = MKPointAnnotation()
        three.coordinate = CLLocationCoordinate2DMake(21.668696, -158.048920)
        three.title = "Pipeline";
        three.subtitle = "Advanced Surfer";
        
        let four = MKPointAnnotation()
        four.coordinate = CLLocationCoordinate2DMake(21.601072, -158.106303)
        four.title = "Puena Point";
        four.subtitle = "Beginners";
        
        let five = MKPointAnnotation()
        five.coordinate = CLLocationCoordinate2DMake(21.675200, -158.041196)
        five.title = "Sunset Beach";
        five.subtitle = "Intermediate";
        
        let six = MKPointAnnotation()
        six.coordinate = CLLocationCoordinate2DMake(21.639877, -158.063393)
        six.title = "Waimea Beach";
        six.subtitle = "Advanced Surfer";
        
        let seven = MKPointAnnotation()
        seven.coordinate = CLLocationCoordinate2DMake(21.280494, -157.84367)
        seven.title = "Bowls";
        seven.subtitle = "Advanced Surfer";
        
        let eight = MKPointAnnotation()
        eight.coordinate = CLLocationCoordinate2DMake(21.275277, -157.8262)
        eight.title = "Canoes";
        eight.subtitle = "Beginners";
        
        let nine = MKPointAnnotation()
        nine.coordinate = CLLocationCoordinate2DMake(21.295237, -158.106582)
        nine.title = "Barbers Point";
        nine.subtitle = "Intermediate Surfer";
        
        let ten = MKPointAnnotation()
        ten.coordinate = CLLocationCoordinate2DMake(21.295237, -158.106582)
        ten.title = "Bath Tubs";
        ten.subtitle = "Intermediate Surfer";
        
        let eleven = MKPointAnnotation()
        eleven.coordinate = CLLocationCoordinate2DMake(21.346563, -158.131017)
        eleven.title = "Makaha";
        eleven.subtitle = "Intermediate Surfer";
        
        let annotations:[MKAnnotation] = [one, two, three, four, five, six, seven, eight, nine, ten, eleven]
        
        mapView?.addAnnotations(annotations)
        mapView?.displayTitleLabel(title: "Surf Sites")
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    // Molokai
    
    func addMolokaiSurfAnnotations(sender: UIViewController) {
        let one = MKPointAnnotation()
        one.coordinate = CLLocationCoordinate2DMake(21.169805, -156.788701)
        one.title = "Polzath";
        one.subtitle = "Sand & Rock";
        
        let annotations:[MKAnnotation] = [one]
        mapView?.addAnnotations(annotations)
        mapView?.displayTitleLabel(title: "Surf Sites")
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    // Hawaii
    
    func addHawaiiSurfAnnotations(sender: UIViewController) {
        let one = MKPointAnnotation()
        
        one.coordinate = CLLocationCoordinate2DMake(19.633333, -155.983333)
        one.title = "Hapuna Beach";
        one.subtitle = "Beach Break";
        
        let two = MKPointAnnotation()
        two.coordinate = CLLocationCoordinate2DMake(19.751980, -155.085830)
        two.title = "Hanoli'i";
        two.subtitle = "River mouth, busy.";
        
        let annotations:[MKAnnotation] = [one, two]
        
        mapView?.addAnnotations(annotations)
        mapView?.displayTitleLabel(title: "Surf Sites")
        
    }
}

// ===================================================================================================
// MARK: -

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
    func mapView(_: MKMapView, didSelect: MKAnnotationView) {
        return
    }
}

extension MolokaiViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, didSelect: MKAnnotationView) {
        return
    }
}

extension MauiViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, didSelect: MKAnnotationView) {
        return
    }
}


extension HawaiiViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, didSelect: MKAnnotationView) {
        return
    }
}


