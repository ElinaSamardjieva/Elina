//
//  HomeViewController.swift
//  Elina
//
//  Created by Dea Pamukchieva on 3/28/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate, DatePickerViewDelegate {
    
    @IBOutlet var invisibleView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var maleButon: UIButton!
    @IBOutlet var femaleButton: UIButton!
    @IBOutlet var birthdayButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var kidsTextField: CustomTextField!
    
    @IBOutlet var kidsSwitch: UISwitch!
    
    var birthdayPickerView: UIDatePicker!
    var selectedDate: NSDate?
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Delegates
        phoneTextField.delegate = self
        
        // MARK: - Keyboard dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // MARK: - Button UI
        birthdayButton.backgroundColor = UIColor.clearColor()
        birthdayButton.layer.borderWidth = 2
        birthdayButton.layer.borderColor = UIColor.whiteColor().CGColor
        birthdayButton.layer.cornerRadius = 5
        birthdayButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        registerButton.backgroundColor = UIColor.clearColor()
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.whiteColor().CGColor
        registerButton.layer.cornerRadius = 5
        registerButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        customizeButton(maleButon)
        customizeButton(femaleButton)
        
        // MARK: - Constraints
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // MARK: - Profile picture
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - DatePicker functions
    @IBAction func birthdayButtonClicked(sender: UIButton) {
        
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
    
    @IBAction func kidsSwitchPressed(sender: UISwitch) {
        
        heightConstraint.constant = sender.on ? 30 : 0
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.layoutIfNeeded()
        }
        
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
