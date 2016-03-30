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
    
    @IBOutlet var phoneTextField: UITextField!
    
    var birthdayPickerView: UIDatePicker!
    var selectedDate: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Keyboard dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // MARK: - Button UI
        birthdayButton.backgroundColor = UIColor.clearColor()
        birthdayButton.layer.borderWidth = 2
        birthdayButton.layer.borderColor = UIColor.whiteColor().CGColor
        birthdayButton.layer.cornerRadius = 5
        birthdayButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        customizeButton(maleButon)
        customizeButton(femaleButton)
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
}


//func changeStyle (textField: UITextField) {
//
//    // titlePlaceholder = (textField.attributedPlaceholder?.string)!
//    
//    textField.layer.borderWidth = 2
//    textField.layer.borderColor = UIColor.whiteColor().CGColor
//    textField.layer.cornerRadius = 5
//    textField.attributedPlaceholder = NSAttributedString(string: (textField.attributedPlaceholder?.string)!,
//        attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
//}

