//
//  ViewController.swift
//  AgriUber
//
//  Created by Nguyen Xuan Phu on 3/24/21.
//  Copyright © 2021 Nguyen Xuan Phu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Propreties

    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let attributedString = NSAttributedString(string: "Forgot password", attributes: [NSAttributedString.Key.underlineStyle: 1.0,])
        forgotPasswordLabel.attributedText = attributedString
    }
    
    
}

