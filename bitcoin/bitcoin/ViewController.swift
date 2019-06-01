//
//  ViewController.swift
//  bitcoin
//
//  Created by Luan Winck on 01/06/19.
//  Copyright © 2019 CWI software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func onTouchDetailCoin(_ sender: Any) {
        
        self.performSegue(withIdentifier: "detail", sender: sender)
    }
    

}

