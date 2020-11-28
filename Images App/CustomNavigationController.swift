//
//  CustomNavigationController.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    var isBarTransparent: Bool? {
        willSet {
            guard let newValue = newValue else {return}
            
            if newValue {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.isTranslucent = true
                view.backgroundColor = .clear
            } else {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.isTranslucent = true
                view.backgroundColor = .clear
            }
        }
    }
    
    func goToVC(vc: UIViewController) {
        let currentVC = self.viewControllers[viewControllers.count - 1]
        if !(vc.isKind(of: type(of: currentVC))) {
            for viewcontroller in viewControllers {
                if vc.isKind(of: type(of: viewcontroller)) {
                    self.popToViewController(viewcontroller, animated: true)
                    return
                }
            }
        }
    }
}
