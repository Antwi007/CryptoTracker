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
        
        
        title = "\(currency.getName()) Details"
        view.backgroundColor = .white
        
        
        fetchIcon()
        
        iconView = UIImageView(image: currency.getIcon())
        
        titleLabel = UILabel()
        titleLabel.text = "\t\(currency.getName())"
        titleLabel.font = titleLabel.font.withSize(30)
        titleLabel.textAlignment = .natural
        titleLabel.layer.backgroundColor = UIColor(red: 0/255, green: 234/255, blue: 100/255, alpha: 0.15).cgColor
        
        marketCapLabel = UILabel()
        marketCapLabel.text = "Market Cap: "
        marketCapLabel.textAlignment = .natural
        marketCapLabel.layer.backgroundColor = UIColor(red: 0/255, green: 234/255, blue: 100/255, alpha: 0.2).cgColor
        
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
        iconLink = iconLink + "\(currency.getID().replacingOccurrences(of: " ", with: "-")).png"
        
        let api = API()
        currency.setIcon(icon: api.getImageFromURLString(urlString: iconLink)!)
        
    }
    
    func layoutSubviews(){
        iconView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        iconView.center = CGPoint(x: view.center.x, y: view.center.y)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 75)
        titleLabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.15)
        
        marketCapLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        marketCapLabel.center = CGPoint(x: view.center.x, y: titleLabel.center.y + 40)
    }

}
