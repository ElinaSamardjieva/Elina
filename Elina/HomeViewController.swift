//
//  HomeViewController.swift
//  Elina
//
//  Created by Dea Pamukchieva on 3/28/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, DatePickerViewDelegate {
    
    @IBOutlet var invisibleView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var maleButon: UIButton!
    @IBOutlet var femaleButton: UIButton!
    @IBOutlet var birthdayButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var changePictureButton: UIButton!
    
    @IBOutlet var emailTextField: CustomTextField!
    @IBOutlet var passwordTextField: CustomTextField!
    @IBOutlet var confirmPasswordTextField: CustomTextField!
    @IBOutlet var firstNameTextField: CustomTextField!
    @IBOutlet var lastNameTextField: CustomTextField!
    @IBOutlet var addressLineTextField: CustomTextField!
    @IBOutlet var phoneTextField: CustomTextField!
    @IBOutlet var kidsTextField: CustomTextField!
    
    @IBOutlet var kidsSwitch: UISwitch!
    
    var birthdayPickerView: UIDatePicker!
    var selectedDate: NSDate?
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Delegates

        imagePicker.delegate = self
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        addressLineTextField.delegate = self
        phoneTextField.delegate = self
        
        // MARK: - Keyboard dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // MARK: - Button UI
        changeButtonStyle(birthdayButton)
        changeButtonStyle(registerButton)
        
        customizeButton(maleButon)
        customizeButton(femaleButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // MARK: - Profile picture
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        changePictureButton.layer.cornerRadius = changePictureButton.frame.size.height / 2
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - DatePicker functions
    @IBAction func birthdayButtonPressed(sender: UIButton) {
        
        let datePickerView = DatePickerView.init(frame: UIScreen.mainScreen().bounds, selectedDate: selectedDate)
        datePickerView.delegate = self
        datePickerView.show()
    }
    
    // MARK: - DatePickerView Delegate
    
    func datePickerViewDidPickDate(date: NSDate, sender: DatePickerView) {
        selectedDate = date
        birthdayButton.setTitle(selectedDate?.dateToString(date), forState: .Normal)
        sender.hide()
    }
    
    func customizeButton(button: UIButton) {
        button.setImage(UIImage(named: "check")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Selected)
        button.setImage(UIImage(named: "uncheck")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        button.setImage(UIImage(named: "check")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Highlighted)
        button.tintColor = UIColor.whiteColor()
    }
    
    @IBAction func maleButtonPressed(sender: UIButton) {
        sender.selected = true
        femaleButton.selected = false
    }
    
    @IBAction func femaleButtonPressed(sender: UIButton) {
        sender.selected = true
        maleButon.selected = false
    }
    
    // MARK: - Number of kids
    
    @IBAction func kidsSwitchPressed(sender: UISwitch) {
        
        heightConstraint.constant = sender.on ? 30 : 0
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Profile picture
    
    @IBAction func changePicturePressed(sender: UIButton) {
        
        // MARK: - Alert dialog
        
        let alert = UIAlertController(title: "Change picture", message: "Do you want to choose picture from the gallery or take new photo?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
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
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        profileImageView.image = pickedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigate through TextFields
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        switch (textField) {
            case emailTextField:
                passwordTextField.becomeFirstResponder()
            case passwordTextField:
                confirmPasswordTextField.becomeFirstResponder()
            case confirmPasswordTextField:
                firstNameTextField.becomeFirstResponder()
            case firstNameTextField:
                lastNameTextField.becomeFirstResponder()
            case lastNameTextField:
                addressLineTextField.becomeFirstResponder()
            case addressLineTextField:
                phoneTextField.becomeFirstResponder()
            case phoneTextField:
                phoneTextField.resignFirstResponder()
            default:
                emailTextField.becomeFirstResponder()
        }
        return true
    }
    
    // MARK: Use only special characters in TextField
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string.characters.count == 0 {
            return true
        }
        
        if textField.isEqual(phoneTextField) {
            
            let cs = NSCharacterSet(charactersInString: "0123456789/+")
            
            let filtered = string.componentsSeparatedByCharactersInSet(cs).filter {  !$0.isEmpty }
            let str = filtered.joinWithSeparator("")
            
            return (string != str)
        }
        
        return true
    }
    
    // MARK: - ButtonUI
    
    func changeButtonStyle(button: UIButton) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }

}


//        let textFieldFrame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0)
//        let kidsTextField = UITextField(frame: textFieldFrame)
//
//        kidsTextField.backgroundColor = UIColor.greenColor()
//        view.addSubview(kidsTextField)


//        var bounds: CGRect
//        bounds = kidsTextField.frame
//        bounds.size.height = 30
//        kidsTextField.bounds = bounds

//if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//    profileImageView.contentMode = .ScaleAspectFill
//    profileImageView.image = pickedImage
//}
//dismissViewControllerAnimated(true, completion: nil)


//        alert.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Take a photo", style: UIAlertActionStyle.Default, handler: nil))

//        if .title == "Gallery" {
//            imagePicker.sourceType = .PhotoLibrary
//            presentViewController(imagePicker, animated: true, completion: nil)
//        }


//let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) {
//    UIAlertAction in // = Void in
//    self.imagePicker.sourceType = .PhotoLibrary
//    self.presentViewController(self.imagePicker, animated: true, completion: nil)
//}


//        if textField == emailTextField
//        {
//            passwordTextField.becomeFirstResponder()
//        } else {
//            emailTextField.becomeFirstResponder()
//        }