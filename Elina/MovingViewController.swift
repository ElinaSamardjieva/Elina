//
//  MovingViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/12/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class MovingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var leftTableView: UITableView!
    @IBOutlet var rightTableView: UITableView!
    @IBOutlet var grayView: UIView!
    
    var lastContentOffset: CGFloat = 0
    
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
        
        leftTableView.bounces = false
        rightTableView.bounces = false

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return myImageUrlArray.count
        return DataManager.sharedManager.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCellWithIdentifier("Cell") as! MovingTableViewCell!
        
        cell.cellImageView.image = nil
        
        if (indexPath.row != 2 && tableView == leftTableView) || tableView == rightTableView {
            cell.cellImageView.loadImage(DataManager.sharedManager.dataArray[indexPath.row])
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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        let yRightTableViewOffset = rightTableView.contentOffset.y
    
        // Right table view
        let newYRightTableViewOffsetDown = yRightTableViewOffset + 3
        let newRightTableViewOffsetDown = CGPointMake(0, newYRightTableViewOffsetDown)
    
        let newYRightTableViewOffsetUp = yRightTableViewOffset - 3
        let newRightTableViewOffsetUp = CGPointMake(0, newYRightTableViewOffsetUp)
    
        if scrollView == leftTableView {
            if lastContentOffset < scrollView.contentOffset.y {
                rightTableView.setContentOffset(newRightTableViewOffsetDown, animated: false)
            } else if lastContentOffset > scrollView.contentOffset.y {
                rightTableView.setContentOffset(newRightTableViewOffsetUp, animated: false)
            }
            self.lastContentOffset = scrollView.contentOffset.y
        }
    }
}
