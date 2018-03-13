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

let toolbarWidth:CGFloat = UIScreen.main.bounds.size.width/2

extension MainViewController {
    func setupToolBar() {
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: nil,
                                    right: self.view.safeAreaLayoutGuide.rightAnchor,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        
        let infoButton = UIButton(type: .infoLight)
        infoButton.tag = IslandAssets.mainInfoTag.rawValue
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


extension KauaiViewController {
    func setupToolBar() {
        // Island Nav Container:
        let toolBarContainerView = UIView(frame: CGRect.zero)
        toolBarContainerView.tag = IslandAssets.islandToolbarTag.rawValue
        self.view.addSubview(toolBarContainerView)
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: self.view.safeAreaLayoutGuide.leftAnchor,
                                    right: nil,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        // Menu:
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenuTag.rawValue
        
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        
        // Map:
        let mapImage = UIImage(named: "pin.png")
        let mapButton = UIButton(type: .custom)
        mapButton.tag = IslandAssets.islandMapTag.rawValue
        
        mapButton.setImage(mapImage, for: .normal)
        mapButton.addTarget(self, action: #selector(mapDisplay), for: .touchUpInside)
        
        toolBarContainerView.addSubview(menuButton)
        toolBarContainerView.addSubview(mapButton)
        
        menuButton.anchor(top: nil,
                          bottom: nil,
                          left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 0, width: 32, height: 32)
        
        mapButton.anchor(top: nil,
                         bottom: nil,
                         left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                         right: nil,
                         centerYAnchor: toolBarContainerView.centerYAnchor,
                         centerXAnchor: nil,
                         paddingTop: 0,
                         paddingLeft: 70,
                         paddingBottom: 0,
                         paddingRight: 0, width: 32, height: 32)
    }
}

// ===================================================================================================

extension OahuViewController {
    func setupToolBar() {
        let toolBarContainerView = UIView(frame: CGRect.zero)
        toolBarContainerView.tag = IslandAssets.islandToolbarTag.rawValue
        self.view.addSubview(toolBarContainerView)
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: self.view.safeAreaLayoutGuide.leftAnchor,
                                    right: nil,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        // Menu:
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenuTag.rawValue
        
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        
        // Map:
        let mapImage = UIImage(named: "pin.png")
        let mapButton = UIButton(type: .custom)
        mapButton.tag = IslandAssets.islandMapTag.rawValue
        
        mapButton.setImage(mapImage, for: .normal)
        mapButton.addTarget(self, action: #selector(mapDisplay), for: .touchUpInside)
        
        toolBarContainerView.addSubview(menuButton)
        toolBarContainerView.addSubview(mapButton)
        
        menuButton.anchor(top: nil,
                          bottom: nil,
                          left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 0, width: 32, height: 32)
        
        mapButton.anchor(top: nil,
                         bottom: nil,
                         left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                         right: nil,
                         centerYAnchor: toolBarContainerView.centerYAnchor,
                         centerXAnchor: nil,
                         paddingTop: 0,
                         paddingLeft: 70,
                         paddingBottom: 0,
                         paddingRight: 0, width: 32, height: 32)
    }
}

// ===================================================================================================

extension MolokaiViewController {
    func setupToolBar() {
        let toolBarContainerView = UIView(frame: CGRect.zero)
        toolBarContainerView.tag = IslandAssets.islandToolbarTag.rawValue
        self.view.addSubview(toolBarContainerView)
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: self.view.safeAreaLayoutGuide.leftAnchor,
                                    right: nil,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        // Menu:
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenuTag.rawValue
        
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        
        // Map:
        let mapImage = UIImage(named: "pin.png")
        let mapButton = UIButton(type: .custom)
        mapButton.tag = IslandAssets.islandMapTag.rawValue
        
        mapButton.setImage(mapImage, for: .normal)
        mapButton.addTarget(self, action: #selector(mapDisplay), for: .touchUpInside)
        
        toolBarContainerView.addSubview(menuButton)
        toolBarContainerView.addSubview(mapButton)
        
        menuButton.anchor(top: nil,
                          bottom: nil,
                          left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 0, width: 32, height: 32)
        
        mapButton.anchor(top: nil,
                         bottom: nil,
                         left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                         right: nil,
                         centerYAnchor: toolBarContainerView.centerYAnchor,
                         centerXAnchor: nil,
                         paddingTop: 0,
                         paddingLeft: 70,
                         paddingBottom: 0,
                         paddingRight: 0, width: 32, height: 32)
    }
}

// ===================================================================================================

extension MauiViewController {
    func setupToolBar() {
        let toolBarContainerView = UIView(frame: CGRect.zero)
        toolBarContainerView.tag = IslandAssets.islandToolbarTag.rawValue
        self.view.addSubview(toolBarContainerView)
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: self.view.safeAreaLayoutGuide.leftAnchor,
                                    right: nil,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        // Menu:
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenuTag.rawValue
        
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        
        // Map:
        let mapImage = UIImage(named: "pin.png")
        let mapButton = UIButton(type: .custom)
        mapButton.tag = IslandAssets.islandMapTag.rawValue
        
        mapButton.setImage(mapImage, for: .normal)
        mapButton.addTarget(self, action: #selector(mapDisplay), for: .touchUpInside)
        
        toolBarContainerView.addSubview(menuButton)
        toolBarContainerView.addSubview(mapButton)
        
        menuButton.anchor(top: nil,
                          bottom: nil,
                          left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 0, width: 32, height: 32)
        
        mapButton.anchor(top: nil,
                         bottom: nil,
                         left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                         right: nil,
                         centerYAnchor: toolBarContainerView.centerYAnchor,
                         centerXAnchor: nil,
                         paddingTop: 0,
                         paddingLeft: 70,
                         paddingBottom: 0,
                         paddingRight: 0, width: 32, height: 32)
    }
}

// ===================================================================================================

extension HawaiiViewController {
    func setupToolBar() {
        if let toolBarContainerView = view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
            toolBarContainerView.isHidden = false
            return
        }
        let toolBarContainerView = UIView(frame: CGRect.zero)
        toolBarContainerView.tag = IslandAssets.islandToolbarTag.rawValue
        self.view.addSubview(toolBarContainerView)
        toolBarContainerView.anchor(top: nil,
                                    bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                    left: self.view.safeAreaLayoutGuide.leftAnchor,
                                    right: nil,
                                    centerYAnchor: nil,
                                    centerXAnchor: nil,
                                    paddingTop: 0,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingRight: 0, width: toolbarWidth, height: 44)
        
        // Menu:
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenuTag.rawValue
        
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        
        // Map:
        let mapImage = UIImage(named: "pin.png")
        let mapButton = UIButton(type: .custom)
        mapButton.tag = IslandAssets.islandMapTag.rawValue
        
        mapButton.setImage(mapImage, for: .normal)
        mapButton.addTarget(self, action: #selector(mapDisplay), for: .touchUpInside)
        
        toolBarContainerView.addSubview(menuButton)
        toolBarContainerView.addSubview(mapButton)
        
        menuButton.anchor(top: nil,
                          bottom: nil,
                          left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                          right: nil,
                          centerYAnchor: toolBarContainerView.centerYAnchor,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 0, width: 32, height: 32)
        
        mapButton.anchor(top: nil,
                         bottom: nil,
                         left: toolBarContainerView.safeAreaLayoutGuide.leftAnchor,
                         right: nil,
                         centerYAnchor: toolBarContainerView.centerYAnchor,
                         centerXAnchor: nil,
                         paddingTop: 0,
                         paddingLeft: 70,
                         paddingBottom: 0,
                         paddingRight: 0, width: 32, height: 32)
    }
}

// ===================================================================================================

class HawaiianScrollView: UIScrollView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //   recenterIfNecessary()
        //        // Tile content in visible bounds
        //        let visibleBounds = self.bounds
        //        // Min & Max values of the scroll view:
        //        let minimumVisibleX = visibleBounds.minX
        //        let maximumVisibleX = visibleBounds.maxX
        //
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    // Compute when it's time to re-center:
    
    func recenterIfNecessary() {
        let photos = self.subviews
        let currentOffset: CGPoint = self.contentOffset
        let contentWidth: CGFloat = self.contentSize.width
        // Calculate what the content offset that would be perfectly centered
        // in the middle our our content would be.
        // ...where the left content is the same length as the right content (horz scrolling):
        let centerOffsetX: CGFloat = (contentWidth - self.bounds.size.width/2.0)
        
        // Where we are now: currentOffset.x vs
        // Where we want to be: centerOffsetX
        let distanceFromCenter: CGFloat = fabs(currentOffset.x - centerOffsetX)
        
        if (distanceFromCenter > (contentWidth / 4.0)) {
            self.contentOffset = CGPoint(x: centerOffsetX, y: currentOffset.y)
            photos.forEach { (photo) in
                var center = photo.center
                center.x += (centerOffsetX - currentOffset.x)
                photo.center = center
            }
        }
    }
}











