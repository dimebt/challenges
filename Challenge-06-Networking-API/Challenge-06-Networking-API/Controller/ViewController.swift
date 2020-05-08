//
//  ViewController.swift
//  Challenge-06-Networking-API
//
//  Created by Dimitar Stefanovski on 5/8/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    
    private let loader = UIActivityIndicatorView()
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var bitcoinLabel: UILabel!
    @IBOutlet private weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        coinManager.delegate = self
        coinManager.fetch(currency: coinManager.currencyArray[4])
        view.addSubview(loader)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        print("Selected: \(currency)")
        bitcoinLabel.text = ""
        showLoader()
        self.currencyLabel.text = currency
        coinManager.fetch(currency: currency)
    }
    
    private func showLoader() {
        loader.center = view.center
        loader.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loader.isHidden = false
        loader.startAnimating()
    }
    
    private func hideLoader() {
        self.loader.isHidden = true
        self.loader.stopAnimating()
    }
    
}

extension ViewController: CoinManagerDelegate {
    
    func didFetch(coinData: CoinData, for currency: String) {
        DispatchQueue.main.async {
            self.hideLoader()
            self.bitcoinLabel.text = coinData.rate.bitCoinFormat
            self.currencyLabel.text = coinData.asset_id_quote
        }
    }
    
    func didFailWith(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}

