//
//  API.swift
//  CryptoTracker
//
//  Created by Matt Schwimmer on 7/10/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class API {
    
    let link = "https://api.coinmarketcap.com/v1/ticker/?limit=\(feedNum)"
    let iconLinkPrefix = "https://files.coinmarketcap.com/static/img/coins/128x128/"
    
    
    
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
                    let currencies = self.getCurrenciesFromJSON(json: dictionary)
                    completion(currencies)
                }
            }
        
        }
        
        task.resume()
        
    }
    
    func getDictionaryFromData(data: Data) -> [[String: Any]]?{
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
            if let jsonDictionary = jsonObject as? [[String: Any]] {
                return jsonDictionary
            }
        }
        return nil
    }
    
    func getCurrenciesFromJSON(json: [[String: Any]]) -> [Currency] {
        var currencies = [Currency]()
        
        if let currenciesJSONArray = json as? [[String: Any]] {
            for currencyJSON in currenciesJSONArray {
                if let name = currencyJSON["name"] as? String,
                    let symbol = currencyJSON["symbol"] as? String,
                    let price = currencyJSON["price_usd"] as? String,
                    let rank = currencyJSON["rank"] as? String,
                    let change24h = currencyJSON["percent_change_24h"] as? String,
                    let id = currencyJSON["id"] as? String,
                    let marketCap = currencyJSON["market_cap_usd"] as? String{
                    
                    let formattedName = id.replacingOccurrences(of: " ", with: "-")

                    let iconLink = iconLinkPrefix + "\(formattedName).png"
                    
                    
                    let currency = Currency(name: name, symbol: symbol, price: price, rank: rank, icon: (getImageFromURLString(urlString: iconLink)), change24h: change24h, marketCap_usd: marketCap, id: id)

                    
                    currencies.append(currency)
                }
            }
        }
        
        return currencies
    }
    
    
    
    
    
    func getImageFromURLString(urlString: String) -> UIImage? {
        
        
        let imageURL = URL(string: urlString)
        if let imageData = try? Data(contentsOf: imageURL!) {
            let image = UIImage(data: imageData)
            return image
        }
        return nil
    }
    
    
    
    
    
    
    
}
