//
//  ResultCollectionViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

protocol ShowPhotoDelegate {
    func showPhoto(myImageView: UIImageView, sender: ResultCollectionViewCell) -> UIImageView
}


class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoImageView: UIImageView!
    var delegate: ShowPhotoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .ScaleAspectFill
        photoImageView.layer.cornerRadius = CGRectGetHeight(photoImageView.bounds) / 2.0
    }
    
    func showPhotoCalled() {
        print("Function called")
        if let delegate = delegate {
            delegate.showPhoto(photoImageView, sender: self)
        }
    }
}
