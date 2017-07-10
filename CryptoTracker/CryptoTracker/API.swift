//
//  API.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/10/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class API {
    
    let link = "https://api.coinmarketcap.com/v1/ticker/?limit=10"
    
    func fetchCurrencies (completion: @escaping ([Currency]) -> ()) {
        guard let url = URL(string: link) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let unwrappedData = data {
                if let dictionary = self.getDictionaryFromData(data: unwrappedData){
                    let currency = self.getCurrencyFromJSON(json: dictionary)
                    completion currency
                }
            }
        
        }
        
        
    }
    
    func getDictionaryFromData(data: Data) -> [String: Any]?{
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
            if let jsonDictionary = jsonObject as? [String: Any] {
                return jsonDictionary
            }
        }
        
    }
    
    func getCurrenciesFromJSON(json: [String: Any]) -> Currency? {
        var currencies = [Currency]()
        
        if let currencyJSONArray = 
        
        if let name = json["name"] as? String, let symbol = json["symbol"] as? String, let price = json["price_usd"] as? String {
            let currency = Currency(name: name, symbol: symbol, price: price)
            return currency
        }
        
        return nil
    }
    
    
    
    
    
}
