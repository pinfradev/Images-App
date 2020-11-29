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

enum CurrentSection {
    case photos
    case favorites
}
class ImageView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var everyImage = [PhotoModel]()
    var imagesToShow = [PhotoModel]()
    var delegate: ImageSelectionDelegate?
    var currentSection: CurrentSection?
    var filetedImages = [PhotoModel]()
    
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
        self.searchBar.delegate = self
        self.setupCollection()
    }
    
    func setupUI(section: CurrentSection) {
        self.currentSection = section
        switch section {
        case .photos:
            self.titleLabel.text = "Fotos"
        case .favorites:
            self.titleLabel.text = "Favoritos"
        }
    }
    func setupCollection() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell(nibName: "\(ImageCell.self)")
    }
    
    func loadData(photos: [PhotoModel]){
        self.everyImage.append(contentsOf: photos)
        self.imagesToShow = self.everyImage
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

extension ImageView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filetedImages = everyImage.filter { photo in
            if let name = photo.user?.name, name.contains(searchText) {
               return true
            } else {
                return false
            }
        }
        
        self.imagesToShow = filetedImages
        self.collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


