//
//  CollectionViewExtension.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell(nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
}
