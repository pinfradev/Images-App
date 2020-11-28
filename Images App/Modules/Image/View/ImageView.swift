//
//  ImagesView.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

class ImageView: UIView {
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
        self.titleLabel.text = "Fotos"

        self.setupCollection()
    }
    
    func setupCollection() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell(nibName: "\(ImageCell.self)")
    }
    
    
}

extension ImageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageCell.self)", for: indexPath) as? ImageCell{
            return cell
        }
        
        return UICollectionViewCell()
    }
}


