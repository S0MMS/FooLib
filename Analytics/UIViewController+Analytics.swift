//
//  UIViewController+Analytics.swift
//  REI
//
//  Created by Tim Brooks on 3/21/16.
//  Copyright © 2016 REI. All rights reserved.
//
import UIKit

extension UIViewController: AnalyticsProvider {
    
    public func configureAnalytics() {
        if self.analyticsViewController() == nil {
            let className = NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
            let analyticsViewController = AnalyticsViewController(className: className)
            
            // Trigger Lifecycle
            self.addChild(analyticsViewController)
            analyticsViewController.didMove(toParent: self)
            self.view.addSubview(analyticsViewController.view)
        }
    }

    public func clearAnalytics() {
        self.analyticsViewController()?.removeAnalytics()
    }
    
    public func deferTrackState() {
        if let analyticsVC = self.analyticsViewController() {
            analyticsVC.deferTrack()
        }
    }
    
    public func setAdditionalAnalyticsContextData(_ contextData: [String: String]) {
        self.analyticsViewController()?.additionalContext = contextData
    }

    public func getAdditionalAnalyticsContextData() -> [String: String]? {
        return self.analyticsViewController()?.additionalContext
    }
    
    public func setAnalyticsChannel(_ channel: String) {
        self.analyticsViewController()?.channel = channel
    }

    public func setAnalyticsPageName(_ pageName: String) {
        self.analyticsViewController()?.pageName = pageName
    }

    @objc public func getAnalyticsPageName() -> (String)? {
        return self.analyticsViewController()?.pageName
    }
    
    public func getAnalyticsContextData() -> [AnyHashable: Any]? {
        return self.analyticsViewController()?.asContextData()
    }
    
    // CKS: analytics cocoapod tweaks
//    public func getCartContextData(with cart:REICart?) -> [String: String] {
//        var result:[String:String] = [:]
//        if let c = cart {
//            let cartUnits = c.totalItemCount()
//            let cartDemand = c.totalProductPrice
//            result["rei.totalCartQuantity"] = (cartUnits?.stringValue)!
//            result["rei.totalCartDemand"] = (cartDemand?.stringValue)!
//        }
//        else {
//            // -1 for undefined
//            result["rei.totalCartQuantity"] = "-1"
//            result["rei.totalCartDemand"] = "-1"
//        }
//        return result
//    }
    
//    public func getSavedForLaterContextData(with wishlist:REIWishlist?) -> [String:String] {
//        var result:[String:String] = [:]
//        if let c = wishlist {
//            let cartUnits = c.totalItemCount
//            let cartDemand = c.totalProductPrice
//            result["rei.totalSavedQuantity"] = String(describing: cartUnits)
//            result["rei.totalSavedDemand"] = (cartDemand?.stringValue)!
//        }
//        else {
//            // -1 for undefined
//            result["rei.totalSavedQuantity"] = "-1"
//            result["rei.totalSavedDemand"] = "-1"
//        }
//        return result
//    }
    
    public func setAnalyticsProductString(_ productString: String) {
        self.analyticsViewController()?.productsString = productString
    }
    
    @nonobjc
    public var analyticsProductString: String? {
        set {
            self.analyticsViewController()?.productsString = analyticsProductString
        }
        get {
            return self.analyticsViewController()?.productsString
        }
    }
    
    
    public func setAnalyticsSubSection1(_ subSection1: String) {
        self.analyticsViewController()?.subSection1 = subSection1
    }
    
    public func setAnalyticsSubSection2(_ subSection2: String) {
        self.analyticsViewController()?.subSection2 = subSection2
    }

    public func setAnalyticsTemplateType(_ templateType: String) {
        self.analyticsViewController()?.templateType = templateType
    }
    
    @objc func setAnalyticsParameter(_ key: String, value: String) {
        
        guard let analyticsViewController = self.analyticsViewController() else {
            return
        }
        
        // if VC attempts to set analytics parameter but additionalContext
        // does not yet exists...create it.
        if (analyticsViewController.additionalContext == nil) {
            analyticsViewController.additionalContext = [String: String]()
        }
        
        analyticsViewController.additionalContext?[key] = value;
    }
        
    public func updateAnalytics(with dictionary: [String: String]) {
        self.analyticsViewController()?.updateWithDictionary(dictionary)
    }

    

    
    // MARK: - Dispatching Events

    public func dispatchAnalyticsEvent() {
        guard let analyticsViewController = self.analyticsViewController() else {
            return
        }
        
        self.dispatchAnalyticsEvent(analyticsViewController.analyticsPageName(), contextData: analyticsViewController.asContextData())
    }
    
    public func dispatchAnalyticsEvent(_ eventName: String) {
        guard let analyticsViewController = self.analyticsViewController() else {
            return
        }
        
        self.dispatchAnalyticsEvent(eventName, contextData: analyticsViewController.asContextData())
    }
    
    public func dispatchAnalyticsEvent(_ eventName: String, contextData: [AnyHashable: Any]?) {
        guard let analyticsViewController = self.analyticsViewController() else {
            return
        }
        
        analyticsViewController.handleEvent(eventName, contextData: contextData)
    }

    

    
    // MARK: - Helper Methods
    
    fileprivate func analyticsViewController() -> AnalyticsViewController? {
//        var foundController:AnalyticsViewController? = nil
//
//        for viewController in self.children {
//            if viewController.isKind(of: AnalyticsViewController.self) {
//               foundController = viewController as? AnalyticsViewController
//            }
//        }
//
//        return foundController
        return nil
    }
}
