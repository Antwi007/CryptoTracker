//
//  Portfolio.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/18/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import Foundation

class Portfolio {
    
    //fields needed: currency array, funds remaining
    private var currencies: [Currency]!
    private var fundsRemaining: Double!
    
    
    init() {
        fundsRemaining = 50_000
    }
    
    //methods needed: invest
    private func invest(amt: Double){
        //put amt into a currency
        
        //take amt away from funds if there are enough funds
        if (fundsRemaining > amt) {
            fundsRemaining = fundsRemaining - amt
        }
    }
    
    private func getFundsRemaining() -> Double{
        return fundsRemaining
    }
}
