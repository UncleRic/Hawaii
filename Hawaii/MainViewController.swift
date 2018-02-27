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
    
    let toolbarContainerViewTag = 10
    let childIslandViewControllerTag = 500
    
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
        func yPosition() -> CGFloat {
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
    
    // MARK: - Island Buttons
    // Kauai
    
    let KauaiButton:UIButton = {
        var button = UIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(handleKauai), for: .touchUpInside)
        let image = UIImage(named:"Kauai")
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    // Oahu:
    let OahuButton:UIButton = {
        var button = UIButton()
        button.tag = 2
        button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:"Oahu")
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    // Molokai:
    let MolokaiButton:UIButton = {
        var button = UIButton()
        button.tag = 3
        button.addTarget(self, action: #selector(handleMolokai), for: .touchUpInside)
        let image = UIImage(named:"Molokai")
        button.setImage(image, for: .normal)
        return button
    }()
    
    // Maui:
    let MauiButton:UIButton = {
        var button = UIButton()
        button.tag = 4
        button.addTarget(self, action: #selector(handleMaui), for: .touchUpInside)
        let image = UIImage(named:"Maui")
        button.setImage(image, for: .normal)
        return button
    }()
    
    // Hawaii:
    let HawaiiButton:UIButton = {
        var button = UIButton()
        button.tag = 5
        button.addTarget(self, action: #selector(handleHawaii), for: .touchUpInside)
        let image = UIImage(named:"BigIsland")
        button.setImage(image, for: .normal)
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
            KauaiButton.isHidden = true
            OahuButton.isHidden = true
            MolokaiButton.isHidden = true
            MauiButton.isHidden = true
            HawaiiButton.isHidden = true
            toolBarContainerView.isHidden = true
            portraitBackgroundImageView.alpha = 0.0
        } else {
            KauaiButton.isHidden = false
            OahuButton.isHidden = false
            MolokaiButton.isHidden = false
            MauiButton.isHidden = false
            HawaiiButton.isHidden = false
            toolBarContainerView.isHidden = false
            portraitBackgroundImageView.alpha = 1.0
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: -
    
    func displayButtons() {
        
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
                           paddingBottom: -550,
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
                          paddingBottom: -475,
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
                             paddingLeft: 195,
                             paddingBottom: -450,
                             paddingRight: 0.0, width: 62, height: 23)
        
        // Maui:
        view.addSubview(MauiButton)
        MauiButton.anchor(top: nil,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 260,
                          paddingBottom: -400,
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
                            paddingLeft: 320,
                            paddingBottom: -300,
                            paddingRight: 0.0, width: 80, height: 80)
        
        
        
        UIView.animate(withDuration: 0.55, animations: {
            self.view.layoutIfNeeded()
        })
        
        
    }
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Button Handler
    
    @objc func handleKauai() {
        currentIsland = .Kauai
        launchIsland(island: .Kauai)
    }
    
    @objc func handleOahu() {
        currentIsland = .Oahu
        launchIsland(island: .Oahu)
    }
    
    @objc func handleMolokai() {
        currentIsland = .Molokai
        launchIsland(island: .Molokai)
    }
    
    @objc func handleMaui() {
        currentIsland = .Maui
        launchIsland(island: .Maui)
    }
    
    @objc func handleHawaii() {
        currentIsland = .Hawaii
        launchIsland(island: .Hawaii)
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func launchIsland(island: Islands) {
        guard let _ = view.viewWithTag(1) else {
            return
        }
        
        for idx in 1..<6 {
            view.viewWithTag(idx)?.removeFromSuperview()
        }
        
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
        
            childController.view.alpha = 0.0
            childController.view.tag = childIslandViewControllerTag
            
            // Adding child Island ViewController into Main Container ViewController (self):
            
            if let targetView = view.viewWithTag(toolbarContainerViewTag) {
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
        if currentIsland == .Main {
            displayButtons()
        } else {
            currentIsland = .Main
            // Remove child Island ViewController from Main Container ViewController (self):
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
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func weatherAction() {
        WeatherReport.getWeatherData(sender: self) {weatherData in
            print("Do Something")
        }
    }
    
}

