//
//  PhotoCollectionViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

protocol PickPictureFromGalleryDelegate {
    func pickPictureFromGalleryDidPressedButton()
}

class AddPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pickPhotoButton: UIButton!
    var delegate: PickPictureFromGalleryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pickPhotoButton.layer.cornerRadius = CGRectGetHeight(pickPhotoButton.bounds) / 2.0
    }
    
    @IBAction func pickPhotoButtonPressed(sender: UIButton) {
        if let delegate = delegate {
            delegate.pickPictureFromGalleryDidPressedButton()
        }
    }
}