//
//  HomeViewController.swift
//  Elina
//
//  Created by Dea Pamukchieva on 3/28/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var invisibleView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 1.0, alpha: 1.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // MARK: - Profile picture
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor

    }
}
