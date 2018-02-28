//
//  HawaiiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class HawaiiViewController: UIViewController, BackgroundDisplay, Overlay {
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupOverlay()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
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
    
    func setupOverlay() {
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = (backgroundImageView?.bounds)!
        backgroundImageView?.addSubview(visualEffectView)
        let myView = UIView(frame:CGRect.zero)
        myView.backgroundColor = UIColor.green
        view.addSubview(myView)
        let mySize = CGSize(width: 100, height: 100)
        myView.center(containerView: view, size: mySize)
        myView.anchor(top: nil,
                      bottom: nil,
                      left: nil,
                      right: nil,
                      centerYAnchor: view.safeAreaLayoutGuide.centerYAnchor,
                      centerXAnchor: view.safeAreaLayoutGuide.centerXAnchor,
                      paddingTop: 0,
                      paddingLeft: 0,
                      paddingBottom: 0,
                      paddingRight: 0, width: 100, height: 200)
    }
    
    
    
    
    
}
