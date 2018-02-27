//
//  KauaiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class KauaiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let titleLabel:UILabel = {
            let label = UILabel()
            label.text = "Kaua'i"
            label.textColor = UIColor.purple
            label.font = UIFont(name: papyrusFont, size: 23.0)
            label.textAlignment = .center
            return label
        }()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: nil,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: view.safeAreaLayoutGuide.centerXAnchor,
                          paddingTop: 80,
                          paddingLeft: 0,
                          paddingBottom: 10,
                          paddingRight: 10, width: 150, height: 32)
        
    }

   
}
