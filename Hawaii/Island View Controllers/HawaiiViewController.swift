//
//  HawaiiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class HawaiiViewController: UIViewController, BackgroundDisplay {
    var portraitBackgroundImage:UIImage?
    var landscapeBackgroundImage: UIImage?
    var backgroundImageView:UIImageView?
    
    let titleLabel:UILabel = {
        var label = UILabel(frame: CGRect.zero)
        label.text = Islands.Hawaii.description()
        label.textAlignment = .center
        label.textColor = UIColor.purple
        label.font = UIFont(name: palatinoFont, size: 32.0)
        return label
    }()
    
    let weatherButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.weather.rawValue
        button.isOpaque = true
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:IslandAssets.weather.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let surfButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.surfing.rawValue
        button.isOpaque = true
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:IslandAssets.surfing.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let lodgingButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.tourist.rawValue
        button.isOpaque = true
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:IslandAssets.lodging.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let touristButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.surfing.rawValue
        button.isOpaque = true
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:IslandAssets.tourist.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let foodButton:UIButton = {
        var button = UIButton()
        button.tag = IslandAssets.food.rawValue
        button.isOpaque = true
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:IslandAssets.food.description())
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let airportButton:UIButton = {
        var button = UIButton()
        button.isOpaque = true
        button.tag = IslandAssets.airport.rawValue
        // button.addTarget(self, action: #selector(handleOahu), for: .touchUpInside)
        let image = UIImage(named:"airport")
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    // ===================================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.view.gestureRecognizers = [tapGesture]
        setupBackground()
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
    
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        if let _ = self.view.viewWithTag(IslandAssets.blurView.rawValue) {
            if let blurView = view.viewWithTag(IslandAssets.blurView.rawValue),
                let islandAssetContainerView = view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                blurView.removeFromSuperview()
                islandAssetContainerView.removeFromSuperview()
            }
        } else {
            setupOverlay()
        }
        
    }
}
