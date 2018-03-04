//
//  Navigator.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/28/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//


import UIKit

class Navigator {
    
    let titleLabel:UILabel = {
        var label = UILabel(frame: CGRect.zero)
        label.text = currentIsland.description()
        label.textAlignment = .center
        label.textColor = UIColor.purple
        label.font = UIFont(name: palatinoFont, size: 32.0)
        return label
    }()
    
    let weatherButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.weather.rawValue
        button.isOpaque = true
        let image = UIImage(named:IslandAssets.weather.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let surfButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.surfing.rawValue
        button.isOpaque = true
        let image = UIImage(named:IslandAssets.surfing.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let lodgingButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.tourist.rawValue
        button.isOpaque = true
        let image = UIImage(named:IslandAssets.lodging.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let touristButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.surfing.rawValue
        button.isOpaque = true
        let image = UIImage(named:IslandAssets.tourist.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let foodButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.food.rawValue
        button.isOpaque = true
        let image = UIImage(named:IslandAssets.food.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let airportButton:UIButton = {
        var button = UIButton()
        button.isOpaque = true
        button.tag = IslandAssets.airport.rawValue
        let image = UIImage(named:"airport")
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    
    // -----------------------------------------------------------------------------------------------------
    
    func removeNavigatorOverlay(sender: UIViewController) {
        if let assetContainer = sender.view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
            assetContainer.removeFromSuperview()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Private Functions
    
    fileprivate func setupNavigatorOverlay(host: UIViewController) {
        guard let hostView = host.view else {
            return
        }
        
        let containerView = UIView(frame:CGRect.zero)
        containerView.tag = IslandAssets.assetsContainerView.rawValue
        
        if let hostController = host as? KauaiViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        } else if let hostController = host as? OahuViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        } else if let hostController = host as? MolokaiViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        } else if let hostController = host as? MolokaiViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        } else if let hostController = host as? MauiViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        } else if let hostController = host as? HawaiiViewController {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            containerView.gestureRecognizers = [tapGesture]
        }
        
        hostView.addSubview(containerView)
        
        containerView.anchor(top: hostView.safeAreaLayoutGuide.topAnchor,
                             bottom: hostView.safeAreaLayoutGuide.bottomAnchor,
                             left: hostView.safeAreaLayoutGuide.leftAnchor,
                             right: hostView.safeAreaLayoutGuide.rightAnchor,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: 100,
                             paddingLeft: 20,
                             paddingBottom: -350,
                             paddingRight: -20, width: 0, height: 0)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(weatherButton)
        containerView.addSubview(airportButton)
        containerView.addSubview(touristButton)
        containerView.addSubview(surfButton)
        containerView.addSubview(lodgingButton)
        containerView.addSubview(foodButton)
        
        let x:CGFloat = 10.0; let y:CGFloat = 60.0
        
        // Title:
        titleLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: nil,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: containerView.safeAreaLayoutGuide.centerXAnchor,
                          paddingTop: 0,
                          paddingLeft: x,
                          paddingBottom: 0,
                          paddingRight: 0, width: 200, height: 38)
        // Weather:
        weatherButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             left: containerView.safeAreaLayoutGuide.leftAnchor,
                             right: nil,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: y,
                             paddingLeft: x,
                             paddingBottom: 0,
                             paddingRight: 0, width: 68, height: 68)
        
        // Airport:
        airportButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             left: containerView.safeAreaLayoutGuide.leftAnchor,
                             right: nil,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: y,
                             paddingLeft: x + 136,
                             paddingBottom: 0,
                             paddingRight: 0, width: 68, height: 68)
        
        
        // Tourist:
        touristButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             left: containerView.safeAreaLayoutGuide.leftAnchor,
                             right: nil,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: y,
                             paddingLeft: x + 2*136,
                             paddingBottom: 0,
                             paddingRight: 0, width: 68, height: 68)
        
        // Surfing:
        surfButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: containerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: y + 120,
                          paddingLeft: x,
                          paddingBottom: 0,
                          paddingRight: 0, width: 68, height: 68)
        
        // Lodging:
        lodgingButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             left: containerView.safeAreaLayoutGuide.leftAnchor,
                             right: nil,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: y + 120,
                             paddingLeft: x + 136,
                             paddingBottom: 0,
                             paddingRight: 0, width: 68, height: 68)
        
        // Food:
        foodButton.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: containerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: y + 120,
                          paddingLeft: x + 2*136,
                          paddingBottom: 0,
                          paddingRight: 0, width: 68, height: 68)
        
    }
    
    // ===================================================================================================
    // MARK: - Driver Functions
    
    func setupOverlay(sender: UIViewController) {
        
        let overlayView = UIView(frame:CGRect.zero)
        overlayView.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        
        overlayView.tag = 22
        overlayView.frame = UIScreen.main.bounds
        
        if let hostController = sender as? KauaiViewController  {
            setupNavigatorOverlay(host: hostController)
            weatherButton.addTarget(self, action: #selector(hostController.weatherReport), for: .touchUpInside)
            surfButton.addTarget(self, action: #selector(hostController.surfReport), for: .touchUpInside)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            overlayView.gestureRecognizers = [tapGesture]
            hostController.backgroundImageView?.addSubview(overlayView)
            
        } else if let hostController = sender as? OahuViewController {
            setupNavigatorOverlay(host: hostController)
            weatherButton.addTarget(self, action: #selector(hostController.weatherReport), for: .touchUpInside)
            surfButton.addTarget(self, action: #selector(hostController.surfReport), for: .touchUpInside)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            overlayView.gestureRecognizers = [tapGesture]
            hostController.backgroundImageView?.addSubview(overlayView)
            
        } else if let hostController = sender as? MolokaiViewController {
            setupNavigatorOverlay(host: hostController)
            weatherButton.addTarget(self, action: #selector(hostController.weatherReport), for: .touchUpInside)
            surfButton.addTarget(self, action: #selector(hostController.surfReport), for: .touchUpInside)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            overlayView.gestureRecognizers = [tapGesture]
            hostController.backgroundImageView?.addSubview(overlayView)
            
        } else if let hostController = sender as? MauiViewController {
            setupNavigatorOverlay(host: hostController)
            weatherButton.addTarget(self, action: #selector(hostController.weatherReport), for: .touchUpInside)
            surfButton.addTarget(self, action: #selector(hostController.surfReport), for: .touchUpInside)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            overlayView.gestureRecognizers = [tapGesture]
            hostController.backgroundImageView?.addSubview(overlayView)
            
        } else if let hostController = sender as? HawaiiViewController {
            setupNavigatorOverlay(host: hostController)
            weatherButton.addTarget(self, action: #selector(hostController.weatherReport), for: .touchUpInside)
            surfButton.addTarget(self, action: #selector(hostController.surfReport), for: .touchUpInside)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hostController.handleTapGesture))
            overlayView.gestureRecognizers = [tapGesture]
            hostController.backgroundImageView?.addSubview(overlayView)
        }
    }
}
