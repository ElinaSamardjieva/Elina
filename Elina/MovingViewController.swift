//
//  MovingViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/12/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class MovingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var leftTableView: UITableView!
    @IBOutlet var rightTableView: UITableView!
    @IBOutlet var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Buildings.jpeg")!)
        
        leftTableView.registerNib(UINib(nibName: "MovingTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        leftTableView.backgroundColor = UIColor.clearColor()
        rightTableView.backgroundColor = UIColor.clearColor()
        
        leftTableView.separatorStyle = .None
        rightTableView.separatorStyle = .None
        leftTableView.showsVerticalScrollIndicator = false
        rightTableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCellWithIdentifier("Cell") as! MovingTableViewCell!
        
//        if tableView == leftTableView {
//            if indexPath.row == 3 {
//                cell.backgroundColor = UIColor.clearColor()
//                cell.contentView.backgroundColor = UIColor.clearColor()
//            }
//        }
                
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if tableView == leftTableView {
        return 150.0
        } else {
            return 250
        }
    }
}
