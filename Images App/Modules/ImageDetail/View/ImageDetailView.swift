//
//  ImageDetailView.swift
//  Images App
//
//  Created by Fray Pineda on 11/29/20.
//

import UIKit
import Kingfisher

class ImageDetailView: UIView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var likesNumberLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var collectionNumberLabel: UILabel!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var photosNumberLabel: UILabel!
    @IBOutlet weak var photosLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var webButton: UIButton!
    @IBOutlet weak var photoLikesNumber: UILabel!
    @IBOutlet weak var photoDescription: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    
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
        self.setupUI()
    }
    
    func setupUI() {
        self.profileImage.roundView()
        self.likesLabel.text = "Likes"
        self.collectionLabel.text = "Colecciones"
        self.photosLabel.text = "Fotos"
        self.favoriteButton.roundView(cornerRadius: 15.0)
    }
    
    func setInformation(photo: PhotoModel) {
        if let urlString = photo.user?.profileImage?.medium {
            let url = URL(string: urlString)
            profileImage.kf.setImage(with: url)
        }
        self.nameLabel.text = photo.user?.name ?? ""
        self.biographyLabel.text = photo.user?.bio ?? ""
        self.likesNumberLabel.text = "\(photo.user?.totalLikes ?? 0)"
        self.collectionNumberLabel.text = "\(photo.user?.totalCollections ?? 0)"
        self.photosNumberLabel.text = "\(photo.user?.totalPhotos ?? 0)"
        if let location = photo.user?.location{
            self.locationButton.setTitle(location, for: .normal)
            self.locationButton.isHidden = false
            self.locationButton.isEnabled = true
        } else {
            self.locationButton.isHidden = true
            self.locationButton.isEnabled = false
        }
        if let web = photo.user?.links?.html{
            self.webButton.setTitle(web, for: .normal)
            self.webButton.isHidden = false
            self.webButton.isEnabled = true
        } else {
            self.webButton.isHidden = true
            self.webButton.isEnabled = false
        }
        self.photoLikesNumber.text = "\(photo.likes ?? 0)"
        self.photoDescription.text = photo.description ?? ""
        
    }
    
}
