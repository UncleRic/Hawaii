//
//  MainViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/24/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

enum Islands:Int {
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
            return "Hawaii"
        }
    }
    func launch() {
        switch self {
        case .Kauai:
            print("Kauai")
        case .Oahu:
            print("Oahu")
        case .Molokai:
             print("Molokai")
        case .Maui:
             print("Maui")
        case .Hawaii:
            print("Hawaii")
        }
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var portraitBackgroundImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            portraitBackgroundImageView.alpha = 0.0
        } else {
            portraitBackgroundImageView.alpha = 1.0
        }
    }
    
    
    @IBAction func weatherAction() {
        WeatherReport.getWeatherData(sender: self) {weatherData in
            print("Do Something")
        }
        
    }
    
}

