//
//  PopUpViewController.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/1/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, PopUpViewDelegate {
    
    @IBOutlet var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addOneButton(sender: UIButton) {
        let popUpView = PopUpView.init(frame: UIScreen.mainScreen().bounds, inputText: inputTextView.text, buttonTitles: ["Dismiss"])
        popUpView.delegate = self
        
        // Dismiss keyboard
        view.endEditing(true)
        
        popUpView.show()
    }

    @IBAction func addTwoButtons(sender: UIButton) {
        let popUpView = PopUpView.init(frame: UIScreen.mainScreen().bounds, inputText: inputTextView.text, buttonTitles: ["Dismiss", "Done"])
        popUpView.delegate = self
        // Dismiss keyboard
        view.endEditing(true)
        
        popUpView.show()
    }
    
    // MARK: - PopUpViewDelegate
    func popUpViewDidPressedButton(sender: PopUpView, index: Int) {
        if index == 0 {
            sender.hide()
        }
    }
}
