//
//  Main.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 3/13/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import MapKit

typealias SenderTuple = (vc: UIViewController, island: Islands)

protocol BackgroundDisplay: class {
    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    func setupPortraitBackground()
    func restorePortraitBackground()
    func setupLandscapeBackground()
}

@objc protocol NavigationReport {
    @objc func weatherReport()
    @objc func surfReport()
    @objc func reportMenu()
    @objc func mapDisplay()
    @objc func lodgingReport()
    @objc func touristReport()
}

// -----------------------------------------------------------------------------------------------------

var currentIsland:Islands = .Main
var photoSource = [UIImage]()

public enum Islands:Int {
    case Main = 0
    case Kauai
    case Oahu
    case Molokai
    case Maui
    case Hawaii
    func description() -> String {
        switch self {
        case .Kauai:
            return "Kauai"
        case .Oahu:
            return "Oahu"
        case .Molokai:
            return "Molokai"
        case .Maui:
            return "Maui"
        case .Hawaii:
            return "Big Island"
        default:
            return "none"
        }
    }
    
    public func coord() -> CLLocationCoordinate2D {
        switch self {
        case .Kauai:
            return CLLocationCoordinate2DMake(22.118543, -159.549)
        case .Oahu:
            return CLLocationCoordinate2DMake(21.315603, -157.858093)
        case .Molokai:
            return CLLocationCoordinate2DMake(21.144393, -157.022630)
        case .Maui:
            return CLLocationCoordinate2DMake(20.798363, -156.331925)
        case .Hawaii:
            return CLLocationCoordinate2DMake(19.596770, -155.46)
        default:
            return CLLocationCoordinate2DMake(0.0, 0.0)
        }
    }
    
    public func beaches() -> URL {
        switch self {
        case .Kauai:
            return URL(string: "https://www.gohawaii.com/islands/kauai/things-to-do/beaches")!
        case .Oahu:
            return URL(string: "https://www.gohawaii.com/islands/oahu/things-to-do/beaches")!
        case .Molokai:
            return URL(string: "https://www.gohawaii.com/islands/molokai/things-to-do/beaches")!
        case .Maui:
            return URL(string: "https://www.gohawaii.com/islands/maui/things-to-do/beaches")!
        case .Hawaii:
            return URL(string: "hhttps://www.gohawaii.com/islands/hawaii-big-island")!
        default:
            return URL(string: "https://apple.com")!
        }
    }
    
    // Position of island icons on main screen:
    
    public func yPosition() -> CGFloat {
        switch self {
        case .Kauai:
            return -550
        case .Oahu:
            return -475
        case .Molokai:
            return -450
        case .Maui:
            return -400
        case .Hawaii:
            return -300
        default:
            return 0
        }
    }
}

// -----------------------------------------------------------------------------------------------------

public enum IslandAssets:Int {
    case weather = 1
    case airport
    case tourist
    case surfing
    case lodging
    case food
    case mainToolbarTag = 10
    case islandToolbarTag = 11
    case mapTitleTag = 12
    case overlayViewTag = 22
    case navigatorContainerViewTag = 23
    case mainInfoTag = 50
    case islandMenuTag = 51
    case islandMapTag = 52
    case backgroundImageViewTag = 100
    case webViewTag = 101
    case mapViewTag = 102
    case childIslandViewControllerTag = 500
    func description() -> String {
        switch self {
        case .weather:
            return "weather"
        case .airport:
            return "airport"
        case .tourist:
            return "tourist"
        case .surfing:
            return "surfing"
        case .lodging:
            return "lodging"
        case .food:
            return "food"
        default:
            return ""
        }
        
    }
}
