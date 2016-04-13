//
//  MovingTableViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/12/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class MovingTableViewCell: UITableViewCell {

 //   @IBOutlet var cellLabel: UILabel!
    
    @IBOutlet var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImageView.clipsToBounds = true
    //    cellImageView.layer.cornerRadius = 10
        cellImageView.layer.borderWidth = 7
        cellImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        selectionStyle = .None
        
        backgroundColor = UIColor.clearColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
 //       cellLabel.clipsToBounds = true
 //       cellLabel.layer.cornerRadius = 20
    }
}
