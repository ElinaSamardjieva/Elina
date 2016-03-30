//
//  DatePickerView.swift
//  Elina
//
//  Created by Elina Samardjieva on 3/29/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit


protocol DatePickerViewDelegate {
    
    func datePickerViewDidPickDate(date: NSDate, sender: DatePickerView)
    
}


class DatePickerView: UIView {

    var delegate: DatePickerViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var bottomView:  UIView!
    @IBOutlet var customDatePicker: UIDatePicker!
    
    
    convenience init(frame: CGRect, selectedDate: NSDate?) {
        self.init(frame: frame)
        
        NSBundle.mainBundle().loadNibNamed("DatePickerView", owner: self, options: nil)
        backgroundColor = UIColor.clearColor()
        addSubview(contentView)
        
        if let selectedDate = selectedDate { // check if nil
            customDatePicker.date = selectedDate
        }

    }
    
    func show() {
        
        bottomView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(bottomView.bounds))

        UIView.animateWithDuration(0.5) { () -> Void in
            self.bottomView.transform = CGAffineTransformIdentity
        }
        
        UIApplication.sharedApplication().windows.first!.addSubview(self) // On top of everything, everything else is disabled
    }
    
    func hide() {
        removeFromSuperview()
    }
    
    override func layoutSubviews() { // Only frames
        super.layoutSubviews()
        
        contentView.frame = UIScreen.mainScreen().bounds
        
    }
    
    @IBAction func doneButtonPressed(sender: UIButton) {
        
        if let delegate = delegate {
            delegate.datePickerViewDidPickDate(customDatePicker.date, sender: self)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        
    }
}
