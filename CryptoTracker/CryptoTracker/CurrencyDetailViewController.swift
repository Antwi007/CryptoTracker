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
    var iconLink = "https://files.coinmarketcap.com/static/img/coins/32x32/"
    var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "\(currency.name) Details"
        view.backgroundColor = .white
        
        
        fetchIcon()
        
        iconView = UIImageView(image: currency.icon)
        
        layoutSubviews()
        
        view.addSubview(iconView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchIcon(){
        iconLink = iconLink + "\(currency.name.lowercased()).png"
        
        let api = API()
        currency.icon =  api.getImageFromURLString(urlString: iconLink)
        //currency.icon =  api.getImageFromURLString(urlString: "https://files.coinmarketcap.com/static/img/coins/32x32/bitcoin.png")
        
        
    }
    
    func layoutSubviews(){
        iconView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        iconView.center = CGPoint(x: view.center.x, y: view.center.y)
    }

}
