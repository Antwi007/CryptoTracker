//
//  CustomTabBarController.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/17/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var views: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setup
        
        //first tab bar item
        let priceFeedViewController = PriceFeedViewController()
        let priceFeedNavController = UINavigationController(rootViewController: priceFeedViewController)
        priceFeedNavController.tabBarItem.title = "Coin Feed"
        priceFeedNavController.tabBarItem.image = UIImage(named: "stock_graph")
        
        //tab bar item 2
        let portfolioViewController = PortfolioViewController()
        let portfioliNavController = UINavigationController(rootViewController: portfolioViewController)
        portfioliNavController.tabBarItem.title = "Portfolio"
        portfioliNavController.tabBarItem.image = UIImage(named: "wallet")
        
        
        
        viewControllers = [priceFeedNavController, portfioliNavController]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
