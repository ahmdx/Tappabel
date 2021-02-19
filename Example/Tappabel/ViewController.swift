//
//  ViewController.swift
//  Tappabel
//
//  Created by Ahmed Mohamed on 01/13/2017.
//  Copyright (c) 2017 Ahmed Mohamed. All rights reserved.
//

import UIKit
import Tappabel

class ViewController: UIViewController {

    @IBOutlet weak var tapMeLabel: Tappebel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapMeLabel.tapAction = { label in
            print("Label \(String(describing: label.text)) tapped!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
