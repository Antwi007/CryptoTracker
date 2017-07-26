//
//  PortfolioViewController.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/17/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit


class PortfolioViewController: UIViewController {

    var valueLabel: UILabel!
    var nameLabel: UILabel!
    var portfolioTabel: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.title = "Portfolio"
        
        
        valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 25))
        valueLabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.25)
        valueLabel.text = "$50,000"
        valueLabel.textAlignment = .center
        view.addSubview(valueLabel)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 25))
        nameLabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.20)
        nameLabel.textAlignment = .center
        nameLabel.text = "FEATURE COMING SOON"
        view.addSubview(nameLabel)
        
        portfolioTabel = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.5))
        portfolioTabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.75)
        view.addSubview(portfolioTabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
