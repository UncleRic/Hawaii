//
//  MauiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class MauiViewController: UIViewController, BackgroundDisplay {

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
            if let _ = self.view.viewWithTag(IslandAssets.overlayView.rawValue) {
                if let overlayView = view.viewWithTag(IslandAssets.overlayView.rawValue),
                    let islandAssetContainerView = view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                    overlayView.removeFromSuperview()
                    islandAssetContainerView.removeFromSuperview()
                }
            }
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func setupBackground() {
        let image = UIImage(named:"Maui1")
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
        if let _ = self.view.viewWithTag(IslandAssets.overlayView.rawValue) {
            if let overlayView = view.viewWithTag(IslandAssets.overlayView.rawValue),
                let islandAssetContainerView = view.viewWithTag(IslandAssets.assetsContainerView.rawValue) {
                overlayView.removeFromSuperview()
                islandAssetContainerView.removeFromSuperview()
            }
        } else {
            Navigator().setupOverlay(sender: self)
        }
        
    }
}
