//
//  OahuViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class OahuViewController: UIViewController, BackgroundDisplay, NavigationReport {
    
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    var backgroundScrollView = HawaiianScrollView(frame: CGRect.zero)
    
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
    // MARK: -
    
    func setupPortraitBackground() {
        view.backgroundColor = UIColor.white
        if nil == backgroundImageView {
            backgroundImageView = UIImageView(image:UIImage(named:"Honolulu"))
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
    
    fileprivate func loadImages() {
        let imageView1 = UIImageView(image: UIImage(named: "Oahu1"))
        let imageView2 = UIImageView(image: UIImage(named: "Oahu2"))
        let imageView3 = UIImageView(image: UIImage(named: "Oahu3"))
        let imageView4 = UIImageView(image: UIImage(named: "Oahu4"))
        let imageView5 = UIImageView(image: UIImage(named: "Oahu5"))
        let imageView6 = UIImageView(image: UIImage(named: "Oahu6"))
        let imageView7 = UIImageView(image: UIImage(named: "Oahu7"))
        let imageView8 = UIImageView(image: UIImage(named: "Oahu8"))
        let imageView9 = UIImageView(image: UIImage(named: "Oahu9"))
        let imageView10 = UIImageView(image: UIImage(named: "Oahu10"))
        let imageView11 = UIImageView(image: UIImage(named: "Oahu11"))
        let imageView12 = UIImageView(image: UIImage(named: "Oahu12"))
        let imageView13 = UIImageView(image: UIImage(named: "Oahu13"))
        let imageView14 = UIImageView(image: UIImage(named: "Oahu14 (kualoa)"))
        let imageView15 = UIImageView(image: UIImage(named: "Oahu15 (kualoa-ranch)"))
        let imageView16 = UIImageView(image: UIImage(named: "Oahu16 (Kailua)"))
        let imageView17 = UIImageView(image: UIImage(named: "Oahu17"))
        
        let photos = [imageView9, imageView11, imageView2, imageView4, imageView6, imageView7, imageView10,  imageView13, imageView17, imageView1, imageView3, imageView5, imageView8, imageView12, imageView16, imageView14, imageView15]
    
        var xPosition:CGFloat = 0.0
        backgroundScrollView.isPagingEnabled = true
        var scrollViewContentWidth:CGFloat = 0
        
        for photo in photos {
            photo.frame.size.width = UIScreen.main.bounds.height
            photo.frame.size.height = UIScreen.main.bounds.width
            photo.contentMode = .scaleAspectFit
            photo.frame.origin.x = xPosition
            backgroundScrollView.addSubview(photo)
            xPosition += photo.frame.size.width
            scrollViewContentWidth += photo.frame.size.width
            backgroundScrollView.contentSize = CGSize(width: scrollViewContentWidth, height: photo.frame.size.height)
        }
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
        WeatherService().displayWeatherReport(sender: self)
    }
    
    @objc func surfReport() {
        Navigator().removeNavigatorOverlay(sender: self)
        WebKit.setupWebView(sender: self, forBeach: Islands.Oahu)
    }
    
    @objc func reportMenu() {
        removeVestigialViews()
        Navigator().setupOverlay(sender: self)
    }
}
