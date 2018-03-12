//
//  KauaiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class KauaiViewController: UIViewController, BackgroundDisplay, NavigationReport {
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.gestureRecognizers = [tapGesture]
        setupLandscapeBackground()
        setupToolBar()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            removeVestigialViews()
            let toolBarContainerView = view.viewWithTag(IslandAssets.islandToolbarTag.rawValue)
            toolBarContainerView?.removeFromSuperview()
            backgroundImageView?.image = landscapeBackgroundImage
        } else {
            backgroundImageView?.image = portraitBackgroundImage
            setupToolBar()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func setupLandscapeBackground() {
        view.backgroundColor = UIColor.white
        
        portraitBackgroundImage = UIImage(named:"KauaiSwim")
        landscapeBackgroundImage = UIImage(named:"KauaiSwim2")
        backgroundImageView = UIImageView(image:portraitBackgroundImage)
        backgroundImageView?.tag = IslandAssets.backgroundImageViewTag.rawValue
        
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
    // MARK: - Private Functions
    
    fileprivate func removeVestigialViews() {
        if let mapView = self.view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            mapView.removeFromSuperview()
        }
        if let containerView = self.view.viewWithTag(IslandAssets.assetsContainerViewTag.rawValue) {
            containerView.removeFromSuperview()
        }
        if let webView = self.view.viewWithTag(IslandAssets.webViewTag.rawValue) {
            webView.removeFromSuperview()
        }
        if let overlay = self.view.viewWithTag(IslandAssets.overlayViewTag.rawValue) {
            overlay.removeFromSuperview()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Gesture Handler
    
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        if let _ = self.view.viewWithTag(IslandAssets.overlayViewTag.rawValue) {
            if let overlayView = view.viewWithTag(IslandAssets.overlayViewTag.rawValue),
                let islandAssetContainerView = view.viewWithTag(IslandAssets.assetsContainerViewTag.rawValue) {
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
        WeatherService().displayWeatherReport(sender: self)
    }
    
    @objc func surfReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        WebKit.setupWebView(sender: self, forBeach: Islands.Kauai)
    }
    
    @objc func reportMenu() {
        removeVestigialViews()
        Navigator().setupOverlay(sender: self)
    }
    
    @objc func mapDisplay() {
        removeVestigialViews()
        if let mapView = view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            mapView.removeFromSuperview()
        } else {
            let mapView = Map.setupMapView(sender: Islands.Kauai)
            view.insertSubview(mapView, belowSubview: view.viewWithTag(IslandAssets.islandToolbarTag.rawValue)!)
            mapView.overlay(containerView: view)
        }
    }
}
