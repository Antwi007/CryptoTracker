//
//  CurrencyDetailViewController.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/19/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

class CurrencyDetailViewController: UIViewController {

    var currency: Currency!
    var iconLink = "https://files.coinmarketcap.com/static/img/coins/128x128/"
    var iconView: UIImageView!
    var titleLabel: UILabel!
    var mCapTitle: UILabel!
    var mCapValue: UILabel!
    var priceLabel: UILabel!
    var statsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "\(currency.getSymbol())"
        view.backgroundColor = .white
        
        
        fetchIcon()
        
        iconView = UIImageView(image: currency.getIcon())
        
        titleLabel = UILabel()
        titleLabel.text = "\(currency.getName())"
        titleLabel.font = titleLabel.font.withSize(45)
        titleLabel.textAlignment = .center
        titleLabel.layer.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.15).cgColor
        
        priceLabel = UILabel()
        priceLabel.text = "$\(currency.getPrice())"
        priceLabel.font = priceLabel.font.withSize(30)
        priceLabel.textAlignment = .center
        
        mCapTitle = UILabel()
        mCapTitle.text = "\tMarket Cap:"
        mCapTitle.font = mCapTitle.font.withSize(25)
        mCapTitle.textAlignment = .natural
        mCapTitle.layer.backgroundColor = UIColor(red: 0/255, green: 234/255, blue: 100/255, alpha: 0.2).cgColor
        
        mCapValue = UILabel()
        //this doesn't work yet
        //let mCap = Int(currency.getMarketCap())?.withCommas()
        
        mCapValue.text = "$\(currency.getMarketCap())"
        mCapValue.font = mCapValue.font.withSize(20)
        mCapValue.textAlignment = .right
        
        statsLabel = UILabel()
        statsLabel.text = "CryptoStats"
        statsLabel.font = statsLabel.font.withSize(30)
        statsLabel.textAlignment = .center
        
        
        
        
        
        layoutSubviews()
        
        
        view.addSubview(statsLabel)
        view.addSubview(mCapValue)
        view.addSubview(mCapTitle)
        view.addSubview(priceLabel)
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
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 75)
        titleLabel.center = CGPoint(x: view.center.x, y: view.frame.height * 0.15)
        
        priceLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        priceLabel.center = CGPoint(x: view.center.x, y: titleLabel.center.y + titleLabel.frame.height * 0.5 + priceLabel.frame.height * 0.5)
        
        iconView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        iconView.center = CGPoint(x: view.center.x, y: priceLabel.center.y + priceLabel.frame.height * 0.5 + iconView.frame.height * 0.5)

        statsLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        statsLabel.center = CGPoint(x: view.center.x, y: iconView.center.y + iconView.frame.height * 0.5 + statsLabel.frame.height * 0.5 + 10)
        
        mCapTitle.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        mCapTitle.center = CGPoint(x: view.center.x, y: statsLabel.center.y + statsLabel.frame.height * 0.5 + mCapTitle.frame.height * 0.5)
        
        mCapValue.frame = mCapTitle.frame
        mCapValue.center = mCapTitle.center
        
        
        
        
    }
    
    

}
