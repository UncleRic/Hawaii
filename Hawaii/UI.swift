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

extension MainViewController {
    
    func setupToolBar() {
        
        let toolbarWidth:CGFloat = UIScreen.main.bounds.size.width/2
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


