//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Matthew Schwimmer on 7/10/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit

class Currency {
    
    var name: String
    var symbol: String
    var price_usd: String
    
    init(name: String, symbol: String, price: String){
        self.name = name
        self.symbol = symbol
        self.price_usd = price
    }
    
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var baseTableView: UITableView!
    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        baseTableView = UITableView(frame: view.frame)
        view.addSubview(baseTableView)
        
        fetchCurrencies()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func festCurrencies(){
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
}

