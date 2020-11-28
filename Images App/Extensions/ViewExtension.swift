//
//  ViewExtension.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

extension UIView {
    
    func initXib() {
        // for init xib in view
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
    }
    
    func addConstraints(contentView: UIView) {
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func roundView(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
