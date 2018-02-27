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
    
    // Kauai
    let KauaiButton:UIButton = {
        var button = UIButton()
        button.setTitleColor(UIColor.yellow, for: .normal)
        let image = UIImage(named:"Kauai")
        button.setBackgroundImage(image, for: .normal)
        button.setTitle("Kauai", for: .normal)
        return button
    }()
    
    // Oahu:
    let OahuButton:UIButton = {
        var button = UIButton()
        button.setTitleColor(UIColor.yellow, for: .normal)
        let image = UIImage(named:"Oahu")
        button.setBackgroundImage(image, for: .normal)
        button.setTitle("Oahu", for: .normal)
        return button
    }()
    
    // Molokai:
    let MolokaiButton:UIButton = {
        var button = UIButton()
        let image = UIImage(named:"Molokai")
        button.setImage(image, for: .normal)
        button.setTitle("Molokai", for: .normal)
        return button
    }()
    
    // Maui:
    let MauiButton:UIButton = {
        var button = UIButton()
        let image = UIImage(named:"Maui")
        button.setImage(image, for: .normal)
        button.setTitle("Kauai", for: .normal)
        return button
    }()
    
    // Hawaii:
    let HawaiiButton:UIButton = {
        var button = UIButton()
        let image = UIImage(named:"BigIsland")
        button.setImage(image, for: .normal)
        button.setTitle("Hawaii", for: .normal)
        return button
    }()
    
    // -----------------------------------------------------------------------------------------------------
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
    
    func displayButtons() {
        //        let targetView = view.viewWithTag(2)
        //        view.insertSubview(KauiaButton, aboveSubview: targetView!)
        
        
                let testView = UIView(frame: CGRect.zero)
                testView.backgroundColor = UIColor.red
        
        // Kauia:
        view.addSubview(KauaiButton)
        KauaiButton.anchor(top: nil,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor,
                        left: view.safeAreaLayoutGuide.leftAnchor,
                        right: nil,
                        centerYAnchor: nil,
                        centerXAnchor: nil,
                        paddingTop: 0,
                        paddingLeft: 10,
                        paddingBottom: -500,
                        paddingRight: 0.0, width: 48, height: 48)
        
        // Oahu:
        view.addSubview(OahuButton)
        OahuButton.anchor(top: nil,
                           bottom: view.safeAreaLayoutGuide.bottomAnchor,
                           left: view.safeAreaLayoutGuide.leftAnchor,
                           right: nil,
                           centerYAnchor: nil,
                           centerXAnchor: nil,
                           paddingTop: 0,
                           paddingLeft: 100,
                           paddingBottom: -450,
                           paddingRight: 0.0, width: 68, height: 48)
        
        // Molokai:
        view.addSubview(MolokaiButton)
        MolokaiButton.anchor(top: nil,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 175,
                          paddingBottom: -430,
                          paddingRight: 0.0, width: 52, height: 23)
        
        // Maui:
        view.addSubview(MauiButton)
        MauiButton.anchor(top: nil,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 220,
                          paddingBottom: -380,
                          paddingRight: 0.0, width: 68, height: 48)
        
        // Big Island:
        view.addSubview(HawaiiButton)
        HawaiiButton.anchor(top: nil,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 300,
                          paddingBottom: -300,
                          paddingRight: 0.0, width: 68, height: 68)
       
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    
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
    
    @objc func infoButtonHandler() {
        
        displayButtons()
        
        //        if currentIsland == .Main {
        //            launchIsland(island: .Kauai)
        //        } else {
        //
        //            displayButtons()
        //            //            currentIsland = .Main
        //            //            if let childController = childController {
        //            //                childController.willMove(toParentViewController: nil)
        //            //                UIView.animate(withDuration: 0.5, animations: {
        //            //                    childController.view.alpha = 0.0
        //            //                }, completion: { (completed) in
        //            //                    childController.view.removeFromSuperview()
        //            //                })
        //            //            }
        //            //        }
        //        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    
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

