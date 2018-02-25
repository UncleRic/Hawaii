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
            print("Landscape")
        } else {
            portraitBackgroundImageView.alpha = 1.0
                    portraitBackgroundImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                          bottom: nil,
                                          left: view.safeAreaLayoutGuide.leftAnchor,
                                          right: view.safeAreaLayoutGuide.rightAnchor,
                                          centerYAnchor: nil,
                                          centerXAnchor: nil,
                                          paddingTop: -40,
                                          paddingLeft: 0,
                                          paddingBottom: 10,
                                          paddingRight: 10, width: 0, height: 200)

            print("Portrait")
        }
    }
    
    
    @IBAction func weatherAction() {
        WeatherReport.getWeatherData(sender: self) {weatherData in
            print("Do Something")
        }
        
    }
    
}

