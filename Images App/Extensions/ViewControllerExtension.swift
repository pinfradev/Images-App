//
//  ViewControllerExtension.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addChildView(view: UIView) {
        self.view.backgroundColor = .white
        switch UIDevice.current.screenType {
        case .iPhone_XSMax_ProMax, .iPhone_11Pro, .iPhone_XR_11, .iPhones_X_XS:
            let frame = CGRect(x: 0.0, y: 60.0, width: self.view.frame.width, height: self.view.frame.height - 120)
            view.frame = frame
            self.view.addSubview(view)
        default:
//            let frame = CGRect(x: 0.0, y: 80.0, width: self.view.frame.width, height: self.view.frame.height - 120)
            view.frame = self.view.frame
            self.view.addSubview(view)
        }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
