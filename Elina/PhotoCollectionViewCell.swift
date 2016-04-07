//
//  ResultCollectionViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

protocol ShowPhotoDelegate {
    func takeImageView(myImageView: UIImageView, sender: PhotoCollectionViewCell) -> UIImageView
    func deleteCell(sender: UIButton)
}


class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var deleteButton: UIButton!

    var delegate: ShowPhotoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .ScaleAspectFill
        photoImageView.layer.cornerRadius = CGRectGetHeight(photoImageView.bounds) / 2.0
        
        deleteButton.layer.cornerRadius = CGRectGetHeight(deleteButton.bounds) / 2.0
        
        deleteButton.hidden = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showDeleteButton")
        self.addGestureRecognizer(tap)
    }
    
    func passPhotoImageView() {
        if let delegate = delegate {
            delegate.takeImageView(photoImageView, sender: self)
        }
    }
    
    @IBAction func deleteRow(sender: UIButton) {
        if let delegate = delegate {
            delegate.deleteCell(sender)
        }
    }
    
    func showDeleteButton() {
        if deleteButton.hidden == true {
            deleteButton.hidden = false
        } else {
            deleteButton.hidden = true
        }
    }
}
