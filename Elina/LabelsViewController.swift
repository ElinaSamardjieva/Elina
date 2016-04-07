//
//  LabelsViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/7/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class LabelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChangeLabelsTitleDelegate {

    @IBOutlet var labelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsTableView.registerNib(UINib(nibName: "LabelsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.labelsTableView.estimatedRowHeight = 100.0
        self.labelsTableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewDidAppear(animated: Bool) {
        
        labelsTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = labelsTableView.dequeueReusableCellWithIdentifier("Cell") as! LabelsTableViewCell
        cell.delegate = self
        cell.change()
        
        cell.backgroundColor = UIColor.blueColor()
        
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 500.0
//    }

    
    func labelNameWillChange(sender: LabelsTableViewCell) {
        sender.topLabel.text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        sender.bottomLabel.text = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
        
        sender.topLabel.backgroundColor = UIColor.yellowColor()
        sender.bottomLabel.backgroundColor = UIColor.orangeColor()
    }
}
