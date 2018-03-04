//
//  OahuViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class OahuViewController: UIViewController, BackgroundDisplay {
    
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.gestureRecognizers = [tapGesture]
        setupBackground()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            if let containerView = self.view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                containerView.removeFromSuperview()
            }
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func setupBackground() {
        let image = UIImage(named:"Honolulu")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor.white
        
        
        view.addSubview(imageView)
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
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
        if let containerView = self.view.viewWithTag(IslandAssets.overlayView.rawValue) {
            containerView.removeFromSuperview()
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
    
    
}
