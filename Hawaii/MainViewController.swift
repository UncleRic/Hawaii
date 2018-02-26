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
    @IBOutlet weak var toolBarContainerView: UIView!
    
    var currentIsland:Islands = .Main
    var childController:UIViewController?
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolBar()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            toolBarContainerView.isHidden = true
            portraitBackgroundImageView.alpha = 0.0
        } else {
            toolBarContainerView.isHidden = false
            portraitBackgroundImageView.alpha = 1.0
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: -
    
    @objc func infoButtonHandler() {
        if currentIsland == .Main {
            launchIsland(island: .Kauai)
        } else {
            currentIsland = .Main
            if let childController = childController {
                childController.willMove(toParentViewController: nil)
                UIView.animate(withDuration: 0.5, animations: {
                    childController.view.alpha = 0.0
                }, completion: { (completed) in
                    childController.view.removeFromSuperview()
                })
            }
        }
    }
    
    func launchIsland(island: Islands) {
        switch island {
        case .Kauai:
            childController = KauaiViewController()
            currentIsland = .Kauai
        case .Oahu:
            childController = OahuViewController()
            currentIsland = .Oahu
        case .Molokai:
            childController = MolokaiViewController()
            currentIsland = .Molokai
        case .Maui:
            childController = MauiViewController()
            currentIsland = .Maui
        case .Hawaii:
            childController = HawaiiViewController()
            currentIsland = .Hawaii
        default:
            childController = nil
            currentIsland = .Main
        }
        
        if let childController = childController {
            childController.view.backgroundColor = UIColor.green
            childController.view.alpha = 0.0
            childController.view.tag = 100
            
            if let targetView = view.viewWithTag(10) {
                self.addChildViewController(childController)
                view.insertSubview(childController.view, belowSubview: targetView)
                childController.view.overlay(containerView: view)
                
                UIView.animate(withDuration: 0.5, animations: {
                    childController.view.alpha = 1.0
                }, completion: { (completed) in
                    childController.didMove(toParentViewController: self)
                })
            }
            
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Actions
    
    @IBAction func weatherAction() {
        
        if currentIsland == .Main {
            launchIsland(island: .Kauai)
        } else {
            currentIsland = .Main
            if let childController = childController {
                childController.willMove(toParentViewController: nil)
                UIView.animate(withDuration: 0.5, animations: {
                    childController.view.alpha = 0.0
                }, completion: { (completed) in
                    childController.view.removeFromSuperview()
                })
            }
        }
        //        WeatherReport.getWeatherData(sender: self) {weatherData in
        //            print("Do Something")
        //        }
        
    }
    
}

