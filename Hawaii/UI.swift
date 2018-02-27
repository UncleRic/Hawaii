//
//  UI.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/24/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func setupToolBar() {
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
