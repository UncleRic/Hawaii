//
//  MainViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/24/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var portraitBackgroundImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
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
    }
    
    // MARK: - UIViewController methods
    
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
    
    // -----------------------------------------------------------------------------------------------------
    
    func launchIsland(island: Islands) {
        let controller:UIViewController
        
        switch island {
        case .Kauai:
            controller = KauaiViewController()
        case .Oahu:
            controller = OahuViewController()
        case .Molokai:
            controller = MolokaiViewController()
        case .Maui:
            controller = MauiViewController()
        case .Hawaii:
            controller = HawaiiViewController()
        }
        
        self.addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        
    }

    // -----------------------------------------------------------------------------------------------------
    // MARK: - Actions
    
    @IBAction func weatherAction() {
        
        launchIsland(island: .Kauai)
        
//        WeatherReport.getWeatherData(sender: self) {weatherData in
//            print("Do Something")
//        }
        
    }
    
}

