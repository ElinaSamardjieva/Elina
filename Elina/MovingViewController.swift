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
    
    var myImageUrlArray = [
        "http://myinternetscout.com/wp-content/uploads/2013/09/20130920-Small-Size-Business-Internet-Strategy.png",
        "http://img.businessdictionary.com/article/small/category-small-business-7.jpg",
        "http://themuslimstartup.com/wp-content/uploads/2014/08/Great-Ideas-For-Business.jpg",
        "http://www.rjinvestment.co.uk/wp-content/uploads/2012/12/business-300px-300x200.jpg",
        "http://www.bizben.com/artwork/increasing-284.jpg",
        "http://www.mit.edu.au/sites/default/files/images/Business-01-optimised.jpg",
        "https://www.sunyocc.edu/uploadedImages/Images/Wide/Business%20feature.jpg",
        "http://420intel.com/sites/default/files/field/image/digital-business%5B1%5D.jpg"]
    
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
        return myImageUrlArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCellWithIdentifier("Cell") as! MovingTableViewCell!
        
        cell.cellImageView.image = nil
        
        if (indexPath.row != 2 && tableView == leftTableView) || tableView == rightTableView {
            cell.cellImageView.loadImage(myImageUrlArray[indexPath.row])
        }
        
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
