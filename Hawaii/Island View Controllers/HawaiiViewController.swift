//
//  HawaiiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class HawaiiViewController: UIViewController, BackgroundDisplay, NavigationReport {
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    
    
    // ===================================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.gestureRecognizers = [tapGesture]
        setupBackground()
        setupToolBar()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            if let containerView = self.view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                containerView.removeFromSuperview()
            }
            backgroundImageView?.image = landscapeBackgroundImage
        } else {
            backgroundImageView?.image = portraitBackgroundImage
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Layout
    
    func setupBackground() {
        view.backgroundColor = UIColor.white
        
        portraitBackgroundImage = UIImage(named:"HawaiiLava2")
        landscapeBackgroundImage = UIImage(named:"HawaiiLava")
        backgroundImageView = UIImageView(image:portraitBackgroundImage)
        backgroundImageView?.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImageView!)
        backgroundImageView?.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                    bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                    left: view.safeAreaLayoutGuide.leftAnchor,
                                    right: view.safeAreaLayoutGuide.rightAnchor,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 10,
                                    paddingRight: 0, width: 0, height: 0)
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Gesture Handler
    
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        if let _ = self.view.viewWithTag(IslandAssets.overlayView.rawValue) {
            if let overlayView = view.viewWithTag(IslandAssets.overlayView.rawValue),
                let islandAssetContainerView = view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                overlayView.removeFromSuperview()
                islandAssetContainerView.removeFromSuperview()
            }
        } else if UIDevice.current.orientation.isPortrait {
            Navigator().setupOverlay(sender: self)
        }
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Navigation
    
    @objc func weatherReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        WeatherService().displayWeatherReport(sender: self)
    }
    
    @objc func surfReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        WebKit.setupWebView(sender: self)
    }
    
    @objc func reportMenu() {
        print("Greetings from Hawaii!")
    }
    
    
}
