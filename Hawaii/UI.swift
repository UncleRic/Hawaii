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
        infoButton.tag = IslandAssets.mainInfo.rawValue
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
        
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenu.rawValue
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        toolBarContainerView.addSubview(menuButton)
        
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
        
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenu.rawValue
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        toolBarContainerView.addSubview(menuButton)
        
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
        
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenu.rawValue
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        toolBarContainerView.addSubview(menuButton)
        
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
        
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenu.rawValue
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        toolBarContainerView.addSubview(menuButton)
        
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
        
    }
}

// ===================================================================================================

extension HawaiiViewController {
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
        
        let menuIcon = UIImage(named: "menuIcon")
        let menuButton = UIButton(type: .custom)
        menuButton.tag = IslandAssets.islandMenu.rawValue
        menuButton.tintColor = UIColor.blue
        menuButton.setImage(menuIcon, for: .normal)
        
        menuButton.addTarget(self, action: #selector(reportMenu), for: .touchUpInside)
        toolBarContainerView.addSubview(menuButton)
        
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
        
    }
}

// ===================================================================================================


