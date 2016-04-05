//
//  PhotoViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PickPictureFromGalleryDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ShowPhotoDelegate {

    @IBOutlet var photoCollectionView: UICollectionView!
    
    var imagePicker = UIImagePickerController()
    var myControllerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.registerNib(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        photoCollectionView.registerNib(UINib(nibName: "ResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellTwo")
        photoCollectionView.backgroundColor = UIColor.lightGrayColor()
        
        imagePicker.delegate = self
    }
    
//    override func viewDidAppear(animated: Bool) {
//        photoCollectionView.reloadData()
//    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if myControllerImageView == nil {
//            return 1
//        } else {
//        return 2
//        }
        
        return 2
    }
    
    func collectionView(let collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1 {
            let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("CellTwo", forIndexPath: indexPath) as! ResultCollectionViewCell
            cell.photoImageView.backgroundColor = UIColor.brownColor()
            cell.delegate = self
            cell.showPhotoCalled()
            
            return cell
        } else {
            let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PhotoCollectionViewCell
            cell.pickPhotoButton.setTitle("Add", forState: .Normal)
            cell.delegate = self
            
            return cell
        }
    }
    
    // MARK: - Sizes of the cells
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.row == 1 {
            if myControllerImageView == nil {
                let cellWidth = CGFloat(0)
                let cellHeight = CGFloat(0)
                let size = CGSizeMake(cellWidth, cellHeight)
                return size
            }
        }
        
        let cellWidth = CGFloat(60)
        let cellHeight = CGFloat(60)
        let size = CGSizeMake(cellWidth, cellHeight)
        
        return size;
    }
    
    // MARK: - Conform the PhotoCell protocol
    func pickPictureFromGalleryDidPressedButton(sender: PhotoCollectionViewCell) {
        let alert = UIAlertController(title: "Change Picture", message: "Choose what you want to do", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            print("Camera working")
        }
        
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showPhoto(myImageView: UIImageView, sender: ResultCollectionViewCell) -> UIImageView {
        myControllerImageView = myImageView
        return myControllerImageView
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        myControllerImageView.image = pickedImage
        photoCollectionView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
}