//
//  WebKit.swift
//  Hawaii
//
//  Created by Frederick C. Lee on 3/2/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import Foundation
import WebKit


class WebKit {
    class public func setupWebView(sender: UIViewController) {
        let webView = WKWebView(frame: UIScreen.main.bounds)
        let url = URL(string: "https://www.tripsavvy.com/best-maui-beaches-1533312")!
        
        webView.load(URLRequest(url:url))
        
        if let hostviewController = sender as? KauaiViewController {
            hostviewController.view.addSubview(webView)
        } else if let hostviewController = sender as? OahuViewController {
            hostviewController.view.addSubview(webView)
        } else if let hostviewController = sender as? MolokaiViewController {
            hostviewController.view.addSubview(webView)
        } else if let hostviewController = sender as? MauiViewController {
            hostviewController.view.addSubview(webView)
        } else if let hostviewController = sender as? HawaiiViewController {
            hostviewController.view.addSubview(webView)
        }
    }
}

