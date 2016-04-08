//
//  LabelsViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/7/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class LabelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var labelsTableView: UITableView!
    
    var arrayOfStrings: [String] = ["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "BBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "A", "B"]
    var secondArrayOfStrings: [String] = ["A", "B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsTableView.registerNib(UINib(nibName: "LabelsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.labelsTableView.estimatedRowHeight = 10.0
        self.labelsTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(animated: Bool) {
        
        labelsTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfStrings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = labelsTableView.dequeueReusableCellWithIdentifier("Cell") as! LabelsTableViewCell
        
        cell.topLabel.text = arrayOfStrings[indexPath.row]
       // cell.bottomLabel.text = secondArrayOfStrings[indexPath.row]
        
        return cell
    }
}