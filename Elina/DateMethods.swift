//
//  DateMethods.swift
//  Elina
//
//  Created by Dea Pamukchieva on 3/29/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import Foundation

extension NSDate {
    func dateToString(date: NSDate) -> String? {
       
        let dateFormatter = NSDateFormatter()
        // dateFormatter.dateStyle = .ShortStyle
        // dateFormatter.timeStyle = .NoStyle
        
       // dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateToString = dateFormatter.stringFromDate(date)
        
        return dateToString
    }
}