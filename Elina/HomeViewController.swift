//
//  HomeViewController.swift
//  Elina
//
//  Created by Dea Pamukchieva on 3/28/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var invisibleView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var birthdayButton: UIButton!
    
    var birthdayPickerView: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Scroll view color
        scrollView.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 1.0, alpha: 1.0)
        
        // MARK: - Keyboard dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // MARK: - Button UI
        birthdayButton.layer.borderWidth = 1
        birthdayButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        birthdayButton.layer.cornerRadius = 5
    
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
        
        birthdayPickerView = UIDatePicker()
        birthdayPickerView.datePickerMode = UIDatePickerMode.Date
        //sender.inputView = birthdayPickerView
        birthdayPickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let pickerSize : CGSize = birthdayPickerView.sizeThatFits(CGSizeZero)
        birthdayPickerView.frame = CGRectMake(0.0, 250, pickerSize.width, 200)
        birthdayPickerView.backgroundColor = UIColor.whiteColor()
        
        // MARK: - Add toolbar
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("Done_Click"))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("Cancel_Click"))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        birthdayPickerView.addSubview(toolBar)
        
        self.view.addSubview(birthdayPickerView)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        //birthdayButton.setTitle = dateFormatter.stringFromDate(sender.date)
        birthdayButton.setTitle(dateFormatter.stringFromDate(sender.date), forState: .Normal)

    }
    
    func Done_Click()
    {
        print("Hello")
        birthdayPickerView.hidden = true
    }
    
    func Cancel_Click()
    {
        print("Hello")
        birthdayPickerView.backgroundColor = UIColor.yellowColor()
    }
}