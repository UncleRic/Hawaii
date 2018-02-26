//
//  Extensions.swift
//  GoogleWeather
//
//  Created by Frederick C. Lee on 2/6/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

extension UIColor {
    class func skyBlue() -> UIColor {
        return UIColor(red: 0.51, green: 0.784, blue: 0.878, alpha: 1.0)
    }
}

// ===================================================================================================

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?,
                centerYAnchor: NSLayoutYAxisAnchor?, centerXAnchor: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                paddingRight: CGFloat, width: CGFloat, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerXAnchor = centerXAnchor {
            self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        }
        if let centerYAnchor = centerYAnchor {
            self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        }
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func overlay(containerView: UIView) {
        anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                               bottom: containerView.safeAreaLayoutGuide.bottomAnchor,
                               left: containerView.safeAreaLayoutGuide.leftAnchor,
                               right: containerView.safeAreaLayoutGuide.rightAnchor,
                               centerYAnchor: nil,
                               centerXAnchor: nil,
                               paddingTop: 0,
                               paddingLeft: 0,
                               paddingBottom: 0,
                               paddingRight: 0, width: 0.0, height: 0)
    }
}
