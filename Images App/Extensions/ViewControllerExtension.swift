//
//  ViewControllerExtension.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

enum ButtonDirection {
    case right
    case left
}

extension UIViewController {
    
    func addChildView(view: UIView) {
        self.view.backgroundColor = .white
        switch UIDevice.current.screenType {
        case .iPhone_XSMax_ProMax, .iPhone_11Pro, .iPhone_XR_11, .iPhones_X_XS:
            let frame = CGRect(x: 0.0, y: 60.0, width: self.view.frame.width, height: self.view.frame.height - 120)
            view.frame = frame
            self.view.addSubview(view)
        default:
            view.frame = self.view.frame
            self.view.addSubview(view)
        }
    }
    
    func setNavBar(icon: UIImage?, buttonType: ButtonDirection,target: Any?,
                   action: Selector?, Color: UIColor = .white,
                   and title: String = "") {
        let button = UIBarButtonItem(image: icon, style: .plain, target: target, action: action)
        switch buttonType {
         case .left:
            navigationItem.leftBarButtonItem = button
            navigationItem.leftBarButtonItem?.tintColor = Color
            navigationItem.leftBarButtonItem?.title = title
        default:
            navigationItem.rightBarButtonItem = button
            navigationItem.rightBarButtonItem?.tintColor = Color
            navigationItem.rightBarButtonItem?.title = title
        }
    }
    
    func showAlert(message: String, completion: (() -> ())? = nil) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: completion)
    }
    
    func hideKeyboardTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
