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
        webView.tag = IslandAssets.webView.rawValue
        let url = URL(string: "https://www.tripsavvy.com/best-maui-beaches-1533312")!
        
        webView.load(URLRequest(url:url))
        
        if let hostViewController = sender as? KauaiViewController {
            if let targetView = hostViewController.view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
                hostViewController.view.insertSubview(webView, belowSubview: targetView)
            }
        } else if let hostViewController = sender as? OahuViewController {
            if let targetView = hostViewController.view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
                hostViewController.view.insertSubview(webView, belowSubview: targetView)
            }
        } else if let hostViewController = sender as? MolokaiViewController {
            if let targetView = hostViewController.view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
                hostViewController.view.insertSubview(webView, belowSubview: targetView)
            }
        } else if let hostViewController = sender as? MauiViewController {
            if let targetView = hostViewController.view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
                hostViewController.view.insertSubview(webView, belowSubview: targetView)
            }
        } else if let hostViewController = sender as? HawaiiViewController {
            if let targetView = hostViewController.view.viewWithTag(IslandAssets.islandToolbarTag.rawValue) {
                hostViewController.view.insertSubview(webView, belowSubview: targetView)
            }
        }
    }
    
    class public func removeWebView(sender: UIViewController) {
        if let hostViewController = sender as? KauaiViewController {
            if let webView = hostViewController.view.viewWithTag(IslandAssets.webView.rawValue) {
                webView.removeFromSuperview()
            }
        } else if let hostViewController = sender as? OahuViewController {
            if let webView = hostViewController.view.viewWithTag(IslandAssets.webView.rawValue) {
                webView.removeFromSuperview()
            }
        } else if let hostViewController = sender as? MolokaiViewController {
            if let webView = hostViewController.view.viewWithTag(IslandAssets.webView.rawValue) {
                webView.removeFromSuperview()
            }
        } else if let hostViewController = sender as? MauiViewController {
            if let webView = hostViewController.view.viewWithTag(IslandAssets.webView.rawValue) {
                webView.removeFromSuperview()
            }
        } else if let hostViewController = sender as? HawaiiViewController {
            if let webView = hostViewController.view.viewWithTag(IslandAssets.webView.rawValue) {
                webView.removeFromSuperview()
            }
        }
    }
}

