//
//  MauiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class MauiViewController: UIViewController, BackgroundDisplay, NavigationReport {
    
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    var backgroundScrollView = UIScrollView(frame: CGRect.zero)
    let map = Map()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        setupPortraitBackground()
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - BackgroundDisplay Protocol functions
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        var isMapShown = false
        
        if let _ = view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            isMapShown = true
        }
        
        if UIDevice.current.orientation.isLandscape {
            removeVestigialViews()
            let toolBarContainerView = view.viewWithTag(IslandAssets.islandToolbarTag.rawValue)
            toolBarContainerView?.isHidden = true
            backgroundImageView?.removeFromSuperview()
            if !isMapShown {
                setupLandscapeBackground()
            }
        } else {
            if !isMapShown {
                backgroundScrollView.removeFromSuperview()
                restorePortraitBackground()
            }
            setupToolBar()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func restorePortraitBackground() {
        removeVestigialViews()
        if let mapView = view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            mapView.removeFromSuperview()
        }
        setupPortraitBackground()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func setupPortraitBackground() {
        view.backgroundColor = UIColor.white
        if nil == backgroundImageView {
            backgroundImageView = UIImageView(image:UIImage(named:"MauiMain"))
            backgroundImageView?.tag = IslandAssets.backgroundImageViewTag.rawValue
            backgroundImageView?.contentMode = .scaleAspectFill
        }
        setupToolBar()
        view.insertSubview(backgroundImageView!, belowSubview: view.viewWithTag(IslandAssets.islandToolbarTag.rawValue)!)
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
    
    func setupLandscapeBackground() {
        view.backgroundColor = UIColor.black
        view.addSubview(backgroundScrollView)
        backgroundScrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
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
    // MARK: Gesture Handler
    
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        reportMenu()
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: -
    
    fileprivate func loadImages() {
        let imageView1 = UIImageView(image: UIImage(named: "MauiMain"))
        let imageView2 = UIImageView(image: UIImage(named: "Maui1"))
        let imageView3 = UIImageView(image: UIImage(named: "Maui2"))
        let imageView4 = UIImageView(image: UIImage(named: "Maui3"))
        let imageView5 = UIImageView(image: UIImage(named: "Maui4"))
        let imageView6 = UIImageView(image: UIImage(named: "Maui5"))
        let imageView7 = UIImageView(image: UIImage(named: "Maui6"))
        let imageView8 = UIImageView(image: UIImage(named: "Maui7"))
        
        let photos = [imageView1, imageView8, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7]
        var xPosition:CGFloat = 0.0
        
        backgroundScrollView.isPagingEnabled = true
        
        var scrollViewContentWidth:CGFloat = 0
        let space:CGFloat = 10.0
        
        for photo in photos {
            photo.frame.size.width = UIScreen.main.bounds.height
            photo.frame.size.height = UIScreen.main.bounds.width
            photo.contentMode = .scaleAspectFill
            photo.frame.origin.x = xPosition
            backgroundScrollView.addSubview(photo)
            xPosition += photo.frame.size.width + space
            scrollViewContentWidth += photo.frame.size.width + space
            backgroundScrollView.contentSize = CGSize(width: scrollViewContentWidth, height: photo.frame.size.height)
        }
    }
    
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Private Functions
    
    fileprivate func removeVestigialViews() {
        if let mapTitleLabel = self.view.viewWithTag(IslandAssets.mapTitleTag.rawValue) {
            mapTitleLabel.removeFromSuperview()
        }
        if let containerView = self.view.viewWithTag(IslandAssets.navigatorContainerViewTag.rawValue) {
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
    // MARK: - Navigation
    
    @objc func weatherReport() {
        WeatherService().displayWeatherReport(sender: self)
    }
    
    @objc func surfReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        if let _ = view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            map.addMauiSurfAnnotations(sender: self)
        } else {
            WebKit.setupWebView(sender: self, forBeach: Islands.Maui)
        }
    }
    
    @objc func lodgingReport() {
        // ....
    }
    
    @objc func touristReport() {
        // ....
    }
    
    @objc func foodReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        // ....
    }
    
    @objc func reportMenu() {
        if let _ = view.viewWithTag(IslandAssets.navigatorContainerViewTag.rawValue) {
            removeVestigialViews()
        } else {
            Navigator().setupOverlay(sender: self)
        }
    }
    
    @objc func mapDisplay() {
        removeVestigialViews()
        if let _ = view.viewWithTag(IslandAssets.mapViewTag.rawValue) {
            restorePortraitBackground()
        } else {
            if let mapView = map.setupMapView(sender: (vc: self, island:Islands.Maui)) {
                mapView.delegate = self
                view.insertSubview(mapView, belowSubview: view.viewWithTag(IslandAssets.islandToolbarTag.rawValue)!)
                mapView.overlay(containerView: view)
            }
        }
        view.setNeedsLayout()
    }
}
