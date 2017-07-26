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
    var iconLink = "https://files.coinmarketcap.com/static/img/coins/128x128/"
    var iconView: UIImageView!
    var titleLabel: UILabel!
    var marketCapLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "\(currency.name) Details"
        view.backgroundColor = .white
        
        
        fetchIcon()
        
        iconView = UIImageView(image: currency.icon)
        titleLabel = UILabel()
        titleLabel.text = "asdf"
        marketCapLabel = UILabel()
        
        layoutSubviews()
        
        
        
        view.addSubview(marketCapLabel)
        view.addSubview(titleLabel)
        view.addSubview(iconView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchIcon(){
        iconLink = iconLink + "\(currency.name.lowercased()).png"
        
        let api = API()
        currency.icon =  api.getImageFromURLString(urlString: iconLink)
        
    }
    
    func layoutSubviews(){
        iconView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        iconView.center = CGPoint(x: view.center.x, y: view.frame.height * 0.25)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 25)
        titleLabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.10)
        
        marketCapLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
    }

}
