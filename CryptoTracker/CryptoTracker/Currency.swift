//
//  Currency.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/19/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit


class Currency {
    
    var name: String
    var symbol: String
    var price_usd: String
    var rank: String
    var icon: UIImage?
    var change24h: String
    
    
    init(name: String, symbol: String, price: String, rank: String, icon: UIImage?, change24h: String){
        self.name = name
        self.symbol = symbol
        self.price_usd = price
        self.rank = rank
        self.icon = icon
        self.change24h = change24h
    }
    
}
