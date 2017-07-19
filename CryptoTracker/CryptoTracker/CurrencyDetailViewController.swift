//
//  CurrencyDetailViewController.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/19/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: UIViewController {

    var currency: Currency!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "\(currency.name) Details"
        view.backgroundColor = .white
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
