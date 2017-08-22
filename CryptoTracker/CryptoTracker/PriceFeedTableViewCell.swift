//
//  PriceFeedTableViewCell.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/11/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class PriceFeedTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var rankLabel: UILabel!
    var priceLabel: UILabel!
    var iconView: UIImageView!
    var changeLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //need super if overriding init
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        nameLabel = UILabel()
        rankLabel = UILabel()
        priceLabel = UILabel()
        iconView = UIImageView()
        changeLabel = UILabel()
        
        //this doesnt work
        //self.backgroundView = UIImageView(image: UIImage(contentsOfFile: "cell_background"))
        
        addSubview(changeLabel)
        addSubview(iconView)
        addSubview(priceLabel)
        addSubview(rankLabel)
        addSubview(nameLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        rankLabel.frame = CGRect(x: 10, y: 0, width: 30, height: frame.height * 0.5)
        
        iconView.frame = CGRect(x: rankLabel.frame.width + 10, y: 0, width: 16, height: 16)
        iconView.center = CGPoint(x: iconView.center.x, y: frame.height * 0.25)
        
        nameLabel.frame = CGRect(x: iconView.frame.width + rankLabel.frame.width + 20, y: 0, width: frame.width * 0.66, height: frame.height * 0.5)
        nameLabel.center = CGPoint(x: nameLabel.center.x, y: frame.height * 0.25)
        
        
        priceLabel.frame = CGRect(x: rankLabel.frame.width + 10, y: 0, width: frame.width, height: frame.height * 0.5)
        priceLabel.center = CGPoint(x: priceLabel.center.x, y: frame.height * 0.75)
        
        changeLabel.frame = CGRect(x: nameLabel.frame.width + 10, y: 0, width: frame.width * 0.33, height: frame.height * 0.5)
        changeLabel.center = CGPoint(x: changeLabel.center.x, y: frame.height * 0.25)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:_ has not been implemented")
    }
    
    //cell constructor
    func setupCellWithCurrency(name: String, symbol: String, rank: String, price: String, icon: UIImage, change: String){
        nameLabel.text = "\(name) (\(symbol))"
        
        rankLabel.text = rank
        priceLabel.text = "Price in USD: $\(price)"
        iconView.image = icon
        
        
        var changeNum = Float(change)
        changeNum = roundf(100.0 * changeNum!) / 100.0
        
        //learned ternary operator
        changeLabel.textColor = change.hasPrefix("-") ? .red : UIColor(red: 55/255, green: 150/255, blue: 45/255, alpha: 1)
        changeLabel.text = "24h: \(changeNum!)%"
    }
    
    
}
