//
//  PopUpViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/1/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addOneButtonPressed(sender: UIButton) {
        let customPopUpView = PopUpView.init(frame: UIScreen.mainScreen().bounds)
       // customPopUpView.show()
    }
    
    @IBAction func addTwoButtonsPressed(sender: UIButton) {
        
    }
    
    @IBAction func addThreeButtonsPressed(sender: UIButton) {
        
    }

}
