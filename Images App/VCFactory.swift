//
//  VCFactory.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

class VCFactory: NSObject {
    
    enum AppVC: Int {
        case images
        case favorites
    }
    
    class func getViewController(_ vc: AppVC) -> UIViewController {
        
        var viewController = UIViewController()
        
        switch vc {
            case .images:
                let viewCtrl = self.instantiateVC(id: "\(ImagesViewController.self)")
                let nav = CustomNavigationController(rootViewController: viewCtrl)
                viewController = nav
            case .favorites:
                break
        }
        
        return viewController
    }
    
    class func instantiateVC(id: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
        return vc
    }
    
    
}
