//
//  PriceFeedTableViewCell.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/11/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class PriceFeedTableViewCell: UITableViewCell {

    var currencyNameLabel: UILabel!
    var symbolLabel: UILabel!
    var rankLabel: UILabel!
    var priceLabel: UILabel!
    var iconView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //need super if overriding init
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        currencyNameLabel = UILabel()
        symbolLabel = UILabel()
        rankLabel = UILabel()
        priceLabel = UILabel()
        iconView = UIImageView()
        
        
        addSubview(iconView)
        addSubview(priceLabel)
        addSubview(rankLabel)
        addSubview(symbolLabel)
        addSubview(currencyNameLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        rankLabel.frame = CGRect(x: 10, y: 0, width: 25, height: frame.height * 0.5)
        
        iconView.frame = CGRect(x: 10, y: frame.height * 0.5, width: 25, height: frame.height * 0.5)
        
        
        currencyNameLabel.frame = CGRect(x: rankLabel.frame.width + 10, y: 0, width: 150, height: frame.height / 2.0)
        currencyNameLabel.center = CGPoint(x: currencyNameLabel.center.x, y: frame.height * 0.25)
        
        symbolLabel.frame = CGRect(x: frame.width * 0.5, y: 0, width: 150, height: frame.height / 2.0)
        symbolLabel.center = CGPoint(x: symbolLabel.center.x, y: frame.height * 0.25)
        
        priceLabel.frame = CGRect(x: rankLabel.frame.width + 10, y: 0, width: frame.width, height: frame.height / 2.0)
        priceLabel.center = CGPoint(x: priceLabel.center.x, y: frame.height * 0.75)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:_ has not been implemented")
    }
    
    //cell constructor
    func setupCellWithCurrency(name: String, symbol: String, rank: String, price: String, icon: UIImage){
        currencyNameLabel.text = name
        symbolLabel.text = "Symbol: \(symbol)"
        rankLabel.text = rank
        priceLabel.text = "Price in USD: \(price)"
        iconView.image = icon
    }
    
    
}
