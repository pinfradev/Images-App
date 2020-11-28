//
//  AppManager.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

class AppManager: NSObject, UITabBarControllerDelegate {
    
    var rootViewController: UIViewController?
    static let shared = AppManager()
    
    fileprivate var _tabBarController: CustomTabController?
    
    var tabBarController: CustomTabController {
        get {
            if _tabBarController == nil {
                _tabBarController = CustomTabController()
                let images = VCFactory.getViewController(.images)
                let favorites = VCFactory.getViewController(.favorites)
                
                self._tabBarController?.viewControllers = [images, favorites]
                self._tabBarController?.view.backgroundColor = .white
            }
            self._tabBarController?.selectedIndex = 0
            return _tabBarController!
        }
        
    }
    
}
