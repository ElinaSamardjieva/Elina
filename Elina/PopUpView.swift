//
//  PopUpView.swift
//  PopUp
//
//  Created by Elina on 4/3/16.
//  Copyright © 2016 Elina. All rights reserved.
//

import UIKit

protocol PopUpViewDelegate {
    func popUpViewDidPressedButton(sender: PopUpView, index: Int)
}

class PopUpView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var topView: UIView!
    @IBOutlet var blurEffectView: UIVisualEffectView!
    @IBOutlet var oneButtonPlaceholder: UIView!
    @IBOutlet var twoButtonsPlaceholder: UIView!
    
    @IBOutlet var button: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    
    @IBOutlet var popUpLabel: UILabel!
    
    var delegate: PopUpViewDelegate?
    
    convenience init(frame: CGRect, inputText: String?, buttonTitles: [String]) {
        self.init(frame: frame)
        
        NSBundle.mainBundle().loadNibNamed("PopUpView", owner: self, options: nil)
        backgroundColor = UIColor.clearColor()
        addSubview(contentView)
        
        if let inputText = inputText { // check if nil
            popUpLabel.text = inputText
        }
        
        if buttonTitles.count > 0 {
            if buttonTitles.count == 1 {
                oneButtonPlaceholder.hidden = false
                
                let buttonTitle = buttonTitles[0]
                button.setTitle(buttonTitle, forState: .Normal)
            } else {
                twoButtonsPlaceholder.hidden = false
                
                firstButton.setTitle(buttonTitles[0], forState: .Normal)
                secondButton.setTitle(buttonTitles[1], forState: .Normal)
            }
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "hidePopUp")
        blurEffectView.addGestureRecognizer(tap)
    }
    
    // NB!!!
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = self.bounds
    }
    
    func show() {
        // MARK: - Show the DatePicker
        topView.transform = CGAffineTransformMakeTranslation(0, -(CGRectGetHeight(self.topView.bounds)))
        blurEffectView.layer.opacity = 0
               
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .CurveEaseOut, animations:  {
            self.topView.transform = CGAffineTransformIdentity
              self.blurEffectView.layer.opacity = 1
            }) { _ in
        }
        UIApplication.sharedApplication().windows.first!.addSubview(self) // On top of everything, everything else is disabled
    }
    
    func hide() {
        //removeFromSuperview()
        
        UIView.animateWithDuration(0.5,
            animations: {
                self.topView.transform = CGAffineTransformMakeTranslation(0, -(CGRectGetHeight(self.topView.bounds)*3))
                self.blurEffectView.layer.opacity = 0.3
            }, completion: { (value: Bool) in
                self.removeFromSuperview()
        })
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        if let delegate = delegate {
            delegate.popUpViewDidPressedButton(self, index: sender.tag - 1)
        }
    }
    
    func hidePopUp() {
        UIView.animateWithDuration(0.5,
            animations: {
                self.topView.transform = CGAffineTransformMakeTranslation(0, -(CGRectGetHeight(self.topView.bounds)*3))
                self.blurEffectView.layer.opacity = 0.3
            }, completion: { (value: Bool) in
                self.removeFromSuperview()
        })
    }
}














// Add button to the topView

//        let popUpButton   = UIButton(type: UIButtonType.System) as UIButton
//        popUpButton.frame = CGRectMake(100, 100, 100, 50)
//        popUpButton.backgroundColor = UIColor.greenColor()
//        popUpButton.setTitle("Test Button", forState: UIControlState.Normal)
//        popUpButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        topView.addSubview(popUpButton)

