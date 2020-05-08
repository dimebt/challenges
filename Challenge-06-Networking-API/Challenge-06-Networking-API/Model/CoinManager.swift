//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetch(coinData: CoinData, for currency: String)
    func didFailWith(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D2717719-BEE1-4C2C-B955-72ACC17ED297"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func fetch(currency: String) {
        if let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWith(error: error)
                }
                if let data = data {
                    if let coinData = self.parseJSON(data) {
                        self.delegate?.didFetch(coinData: coinData, for: currency)
                    }
                } else {
                    // no data error
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(CoinData.self, from: data)
        } catch {
            delegate?.didFailWith(error: error)
        }
        return nil
    }
    
}
