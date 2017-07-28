//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Matthew Schwimmer on 7/10/17.
//  Copyright © 2017 Matthew Schwimmer. All rights reserved.
//

import UIKit


var feedNum = 15

class PriceFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var baseTableView: UITableView!
    var currencies = [Currency]()
    var refreshControl: UIRefreshControl!
    var settingsButton: UIButton!
    
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
        baseTableView.rowHeight = 100
        view.addSubview(baseTableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshFeed), for: UIControlEvents.valueChanged)
        baseTableView.addSubview(refreshControl)
        
        settingsButton = UIButton(type: .custom)
        settingsButton.setImage(UIImage(named: "settings.png"), for: .normal)
        settingsButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        settingsButton.addTarget(self, action: #selector(settingsPressed), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: settingsButton)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        
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
    
    func settingsPressed(){
        let alert = UIAlertController(title: "Feed Settings", message: "Choose Number of Currencies to Show", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in })
        
        let setAction = UIAlertAction(title: "Set", style: .default, handler: { (action: UIAlertAction!) in
            
            let textField = alert.textFields![0] as UITextField
            textField.keyboardType = UIKeyboardType.numberPad
            
            feedNum = Int(textField.text!)!
            self.fetchCurrencies()
        })
        
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
        }
        
        alert.addAction(cancelAction)
        alert.addAction(setAction)
        
        self.present(alert, animated: true, completion: nil)
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
            cell.setupCellWithCurrency(name: currency.getName(), symbol: currency.getSymbol(), rank: currency.getRank(), price: currency.getPrice(), icon: currency.getIcon(), change: currency.getChange24h())
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    
}

