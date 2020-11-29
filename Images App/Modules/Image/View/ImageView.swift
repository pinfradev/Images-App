//
//  ImagesView.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit

protocol ImageSelectionDelegate {
    func imageSelected(photo: PhotoModel)
}

class ImageView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imagesToShow = [PhotoModel]()
    var delegate: ImageSelectionDelegate?
    
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
        self.addConstraints(contentView: self.contentView)
        self.addSubview(self.contentView)
        self.titleLabel.text = "Fotos"

        self.setupCollection()
    }
    
    func setupCollection() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell(nibName: "\(ImageCell.self)")
    }
    
    func loadData(photos: [PhotoModel]){
        self.imagesToShow.append(contentsOf: photos)
        self.collectionView.reloadData()
    }
    
}

extension ImageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageCell.self)", for: indexPath) as? ImageCell{
            if indexPath.row < self.imagesToShow.count {
                cell.setImage(urlString: self.imagesToShow[indexPath.row].urls?.full ?? "")
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < self.imagesToShow.count{
            let photo = self.imagesToShow[indexPath.row]
            delegate?.imageSelected(photo: photo)
        }
    }
}


