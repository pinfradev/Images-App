//
//  ViewController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class CustomTabController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.setupTabBar()
    }
    
    func setupTabBar() {
        let home = VCFactory.getViewController(.images)
        home.tabBarItem.image = #imageLiteral(resourceName: "homeIcon")
        let favorites = VCFactory.getViewController(.favorites)
        favorites.tabBarItem.image = #imageLiteral(resourceName: "favFooter")
        self.viewControllers = [home, favorites]
        self.view.backgroundColor = .white
        self.selectedIndex = 0
    }


}

extension CustomTabController: UITabBarControllerDelegate {
    
}

