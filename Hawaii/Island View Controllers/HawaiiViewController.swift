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
    var backgroundScrollView = UIScrollView(frame: CGRect.zero)
    
    
    // ===================================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.gestureRecognizers = [tapGesture]
        loadImages()
        setupPortraitBackground()
        setupToolBar()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            removeVestigialViews()
            backgroundImageView?.removeFromSuperview()
            setupLandscapeBackground()
        } else {
            backgroundScrollView.removeFromSuperview()
            setupPortraitBackground()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Layout
    
    func setupPortraitBackground() {
        view.backgroundColor = UIColor.white
        if nil == backgroundImageView {
            backgroundImageView = UIImageView(image:UIImage(named:"HawaiiLava2"))
            backgroundImageView?.contentMode = .scaleAspectFill
        }
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
    
    fileprivate func loadImages() {
        let imageView1 = UIImageView(image: UIImage(named: "HawaiiLava"))
        let imageView2 = UIImageView(image: UIImage(named: "BigIsland1"))
        let imageView3 = UIImageView(image: UIImage(named: "BigIsland2"))
        let imageView4 = UIImageView(image: UIImage(named: "BigIsland3"))
        let imageView5 = UIImageView(image: UIImage(named: "BigIsland4"))
        let imageView6 = UIImageView(image: UIImage(named: "BigIsland5"))
        let imageView7 = UIImageView(image: UIImage(named: "BigIsland6"))
        
        let photos = [imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7]
        var xPosition:CGFloat = 0.0
        
        backgroundScrollView.isPagingEnabled = true
        
        var scrollViewContentWidth:CGFloat = 0
        let space:CGFloat = 10.0
        
        for photo in photos {
            photo.frame.size.width = UIScreen.main.bounds.height
            photo.frame.size.height = UIScreen.main.bounds.width
            //photo.center = self.view.center
            photo.contentMode = .scaleAspectFit
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
        if let containerView = self.view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
            containerView.removeFromSuperview()
        }
        if let webView = self.view.viewWithTag(IslandAssets.webView.rawValue) {
            webView.removeFromSuperview()
        }
        if let overlay = self.view.viewWithTag(IslandAssets.overlayView.rawValue) {
            overlay.removeFromSuperview()
        }
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
        removeVestigialViews()
        Navigator().setupOverlay(sender: self)
    }
}
