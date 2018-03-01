//
//  UI.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/24/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import UIKit

let palatinoFont = "Palatino"
let papyrusFont = "Papyrus"

extension MainViewController {
    
    func setupToolBar() {
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonHandler), for: .touchUpInside)
        toolBarContainerView.addSubview(infoButton)
        infoButton.anchor(top: nil,
                          bottom: nil,
                          left: nil,
                          right: toolBarContainerView.safeAreaLayoutGuide.rightAnchor,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          paddingRight: -20, width: 32, height: 32)
    }
    
}

// ===================================================================================================

extension HawaiiViewController: Overlay {
    func setupOverlay() {
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        let vib = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: visualEffectView.effect as! UIBlurEffect))
        visualEffectView.contentView.addSubview(vib)
        visualEffectView.frame = (backgroundImageView?.bounds)!
        backgroundImageView?.addSubview(visualEffectView)
        setupNavigatorOverlay(hostView: self.view)
    }
    
    func setupNavigatorOverlay(hostView: UIView) {
        let containerView = UIView(frame:CGRect.zero)
        containerView.backgroundColor = UIColor.clear
        view.addSubview(containerView)
        let mySize = CGSize(width: 100, height: 100)
        containerView.center(containerView: view, size: mySize)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             bottom: view.safeAreaLayoutGuide.bottomAnchor,
                             left: view.safeAreaLayoutGuide.leftAnchor,
                             right: view.safeAreaLayoutGuide.rightAnchor,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: 100,
                             paddingLeft: 40,
                             paddingBottom: -200,
                             paddingRight: -40, width: 0, height: 0)
        
        containerView.addSubview(weatherButton)
        containerView.addSubview(airportButton)
        containerView.addSubview(touristButton)
        containerView.addSubview(surfButton)
        containerView.addSubview(lodgingButton)
        containerView.addSubview(foodButton)
        
        let x:CGFloat = 10.0; let y:CGFloat = 10.0
        
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
}
