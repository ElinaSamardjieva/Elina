//
//  ResultCollectionViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.layer.cornerRadius = CGRectGetHeight(photoImageView.bounds) / 2.0
    }

}
