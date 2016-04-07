//
//  PhotoViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/4/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PickPictureFromGalleryDelegate, ShowPhotoDelegate {

    @IBOutlet var photoCollectionView: UICollectionView!
    
    var imagePicker = UIImagePickerController()
    var myControllerImageView: UIImageView!
    var pickedImagesArray: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.automaticallyAdjustsScrollViewInsets = false
        
        photoCollectionView.registerNib(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        photoCollectionView.registerNib(UINib(nibName: "AddPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
        
        imagePicker.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pickedImagesArray.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let cellWidth = CGFloat(60)
        let cellHeight = CGFloat(60)
        let size = CGSizeMake(cellWidth, cellHeight)
        
        return size
    }
    
    func collectionView(let collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if pickedImagesArray.count == 0 {
            let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! AddPhotoCollectionViewCell
            cell.pickPhotoButton.setTitle("+", forState: .Normal)
            cell.delegate = self
            
            return cell
            
        } else {
        
        if indexPath.row == (pickedImagesArray.count) {
            
            let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! AddPhotoCollectionViewCell
            cell.pickPhotoButton.setTitle("+", forState: .Normal)
            cell.delegate = self
            
            return cell
            
        } else {
            let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
            cell.photoImageView.backgroundColor = UIColor.brownColor()
            cell.delegate = self
            cell.passPhotoImageView() // HERE IS THE PROBLEM!!!!
            
            return cell
            }
        }
    }
    
    // MARK: - PickPictureFromGalleryDelegate
    
    func pickPictureFromGalleryDidPressedButton() {
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
    
    
    // MARK: - ShowPhotoDelegate
    
    func takeImageView(myImageView: UIImageView, sender: PhotoCollectionViewCell) -> UIImageView {
        myControllerImageView = myImageView
        return myControllerImageView
    }
    
    // MARK: Take the picked photo

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        pickedImagesArray.append(pickedImage!)
        photoCollectionView.reloadData()
        
        // TEST
       // Nil
//        let cell = photoCollectionView.viewWithTag(0) as! PhotoCollectionViewCell
//        cell.photoImageView.image = pickedImage
       // cell!.photoImageView.image = pickedImage
        
        // NB!!!!!!!!
//        if let myControllerImageView = myControllerImageView {
//        myControllerImageView.image = pickedImage
//        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func deleteCell(sender: UIButton) {
        
        var indexPath: NSIndexPath!
        
        if let button = sender as? UIButton {
            if let superview = button.superview {
                if let cell = superview.superview as? PhotoCollectionViewCell {
                    indexPath = photoCollectionView.indexPathForCell(cell)
                }
            }
        }

        print("Index path")
        print(indexPath.row)
        pickedImagesArray.removeAtIndex(indexPath.row)
        photoCollectionView.reloadData()
    }
}