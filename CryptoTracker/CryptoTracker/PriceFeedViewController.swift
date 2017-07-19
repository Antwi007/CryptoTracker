//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Matthew Schwimmer on 7/10/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit




class PriceFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var baseTableView: UITableView!
    var currencies = [Currency]()
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        self.title = "Price Feed"
        
        
        fetchCurrencies()
        
        baseTableView = UITableView(frame: view.frame)
        baseTableView.register(PriceFeedTableViewCell.self, forCellReuseIdentifier: "Reuse")
        baseTableView.dataSource = self
        baseTableView.delegate = self
        baseTableView.rowHeight = 150
        view.addSubview(baseTableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshFeed), for: UIControlEvents.valueChanged)
        baseTableView.addSubview(refreshControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchCurrencies(){
        let api = API()
        api.fetchCurrencies { (currencies: [Currency]) in
            self.currencies = currencies
            
            DispatchQueue.main.sync {
                self.baseTableView.reloadData()
            }
        }
    }
    
    func refreshFeed(){
        fetchCurrencies()
        baseTableView.reloadData()
        refreshControl.endRefreshing()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselck cell after clicking it
        baseTableView.deselectRow(at: indexPath, animated: false)
        
        let detailsViewController = CurrencyDetailViewController()
        
        let currency = currencies[indexPath.row]
        
        detailsViewController.currency = currency
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = baseTableView.dequeueReusableCell(withIdentifier: "Reuse") as? PriceFeedTableViewCell{
            let currency = currencies[indexPath.row]
            cell.setupCellWithCurrency(name: currency.name, symbol: currency.symbol, rank: currency.rank, price: currency.price_usd, icon: currency.icon!, change: currency.change24h)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    
}

