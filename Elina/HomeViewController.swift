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
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var birthdayButton: UIButton!
    
    var birthdayPickerView: UIDatePicker!
    
    var selectedDate: NSDate?

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
        
//        birthdayPickerView = UIDatePicker()
//        birthdayPickerView.datePickerMode = UIDatePickerMode.Date
//        //sender.inputView = birthdayPickerView
//        birthdayPickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
//        
//        let pickerSize : CGSize = birthdayPickerView.sizeThatFits(CGSizeZero)
//        birthdayPickerView.frame = CGRectMake(0.0, 250, pickerSize.width, 200)
//        birthdayPickerView.backgroundColor = UIColor.whiteColor()
//        
//        // MARK: - Add toolbar
//        
//        let toolBar: UIToolbar = UIToolbar()
//        
//        let doneButton = UIBarButtonItem(title: "Done", style: .Done, target: self, action: "Done_Click")
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("Cancel_Click"))
//        
//        toolBar.sizeToFit()
//        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        
        // Outside DatePicker
//         toolBar.frame = CGRectMake(0, self.view.frame.size.height - 46, self.view.frame.size.width, 48)
//         self.view.addSubview(toolBar)
        
        // Inside DatePicker
//        birthdayPickerView.addSubview(toolBar)
//        self.view.addSubview(birthdayPickerView)
        
        let datePickerView = DatePickerView.init(frame: UIScreen.mainScreen().bounds, selectedDate: selectedDate)
        datePickerView.delegate = self
        datePickerView.show()
        
    }
    
    
//    func handleDatePicker(sender: UIDatePicker) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = .MediumStyle
//        dateFormatter.timeStyle = .NoStyle
//        //birthdayButton.setTitle = dateFormatter.stringFromDate(sender.date)
//        birthdayButton.setTitle(dateFormatter.stringFromDate(sender.date), forState: .Normal)
//
//    }
    
    // MARK: - DatePickerView Delegate
    
    func datePickerViewDidPickDate(date: NSDate, sender: DatePickerView) {
        selectedDate = date
       // birthdayButton.setTitle("Date is set", forState: .Normal)
        birthdayButton.setTitle(selectedDate?.dateToString(date), forState: .Normal)
        sender.hide()
    }
}