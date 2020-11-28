//
//  ImagesView.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImagesView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubview()
    }
    
    func initSubview() {
        self.initXib()
        self.addSubview(self.contentView)
        self.titleLabel.text = "PHOTOS"
        self.backgroundColor = .red
    }
    
    
}
