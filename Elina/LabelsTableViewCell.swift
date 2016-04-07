//
//  LabelsTableViewCell.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/7/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

protocol ChangeLabelsTitleDelegate {
    func labelNameWillChange(sender: LabelsTableViewCell)
}


class LabelsTableViewCell: UITableViewCell {

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    var delegate: ChangeLabelsTitleDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func change() {
        if let delegate = delegate {
            delegate.labelNameWillChange(self)
        }
    }
}
