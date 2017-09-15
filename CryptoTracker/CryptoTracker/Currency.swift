//
//  Currency.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/19/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit


class Currency {
    
    private var name: String
    private var symbol: String
    private var price_usd: String
    private var rank: String
    private var icon: UIImage?
    private var change24h: String
    private var change1h: String
    private var change7d: String
    private var marketCap_usd: String
    private var id: String
    
    
    init(name: String, symbol: String, price: String, rank: String, icon: UIImage?, change24h: String, change1h: String, change7d: String, marketCap_usd: String, id: String){
        self.name = name
        self.symbol = symbol
        self.price_usd = price
        self.rank = rank
        self.icon = icon
        self.change24h = change24h
        self.change1h = change1h
        self.change7d = change7d
        self.marketCap_usd = marketCap_usd
        self.id = id
    }
    
    func getName() -> String {
        return name
    }
    
    func getSymbol() -> String {
        return symbol
    }
    
    func getPrice() -> String {
        return price_usd
    }
    
    func getRank() -> String {
        return rank
    }
    
    func getIcon() -> UIImage {
        return icon!
    }
    
    func getChange24h() -> String {
        return change24h
    }
    
    func getChange1h() -> String {
        return change1h
    }
    
    func getChange7d() -> String {
        return change7d
    }
    
    func getMarketCap() -> String {
        return marketCap_usd
    }
    
    func getID() -> String {
        return id
    }
    
    
    func setIcon(icon: UIImage){
        self.icon = icon
    }
    
}
