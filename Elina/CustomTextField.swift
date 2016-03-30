//
//  CustomTextField.swift
//  Elina
//
//  Created by Elina Samardjieva on 3/30/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override var placeholder: String? {
        didSet {
            
            if let placeholder = placeholder {
            
                attributedPlaceholder = NSAttributedString(string: placeholder,
                    attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 5
        self.backgroundColor = UIColor.clearColor()
        
        if let placeholder = placeholder {
            
            attributedPlaceholder = NSAttributedString(string: placeholder,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
    }

}
