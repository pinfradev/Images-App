//
//  ImageCellCollectionViewCell.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundView(cornerRadius: 15.0)
        self.imageView.contentMode = .scaleAspectFill
    }

    func setImage(urlString: String) {
        let url = URL(string: urlString)
        imageView.kf.setImage(with: url)
    }
}
