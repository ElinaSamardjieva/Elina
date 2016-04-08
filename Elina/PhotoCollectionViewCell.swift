//
//  ResultCollectionViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

protocol DeletePhotoDelegate {
    func deleteButtonDidPressDelete(sender: PhotoCollectionViewCell)
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var deleteButton: UIButton!

    var delegate: DeletePhotoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .ScaleAspectFill
        photoImageView.layer.cornerRadius = CGRectGetHeight(photoImageView.bounds) / 2.0
        
        deleteButton.layer.cornerRadius = CGRectGetHeight(deleteButton.bounds) / 2.0
    }
        
    @IBAction func deletePhotoCell(sender: UIButton) {
        if let delegate = delegate {
            delegate.deleteButtonDidPressDelete(self)
        }
    }
}
