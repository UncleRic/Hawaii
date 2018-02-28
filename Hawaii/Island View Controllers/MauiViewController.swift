//
//  MauiViewController.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 2/25/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class MauiViewController: UIViewController, BackgroundDisplay {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
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
}
