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
    
    var currentIsland:Islands = .Main
    
    enum Islands:Int {
        case Main
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
            default:
                return "none"
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
            currentIsland = .Kauai
        case .Oahu:
            controller = OahuViewController()
            currentIsland = .Oahu
        case .Molokai:
            controller = MolokaiViewController()
            currentIsland = .Molokai
        case .Maui:
            controller = MauiViewController()
            currentIsland = .Maui
        case .Hawaii:
            controller = HawaiiViewController()
            currentIsland = .Hawaii
        default:
            controller = self
            currentIsland = .Main
        }
        
        controller.view.backgroundColor = UIColor.green
        self.addChildViewController(controller)
        controller.view.tag = 300
        view.insertSubview(controller.view, belowSubview: view.viewWithTag(1)!)
        controller.didMove(toParentViewController: self)
        controller.view.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               left: view.safeAreaLayoutGuide.leftAnchor,
                               right: view.safeAreaLayoutGuide.rightAnchor,
                               centerYAnchor: nil,
                               centerXAnchor: nil,
                               paddingTop: 0,
                               paddingLeft: 0,
                               paddingBottom: 52,
                               paddingRight: 10, width: 0.0, height: 0)
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Actions
    
    @IBAction func weatherAction() {
        
        if currentIsland == .Main {
            launchIsland(island: .Kauai)
        }
        //        WeatherReport.getWeatherData(sender: self) {weatherData in
        //            print("Do Something")
        //        }
        
    }
    
}

