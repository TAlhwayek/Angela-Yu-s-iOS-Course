//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = Keys.apiKey
    // Fixed array to display most common currency in the beginning
    let currencyArray = ["USD","EUR","GBP", "AUD", "BRL","CAD","CNY","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    // Safely check for data
                    if let bitcoinPrice = self.parseJSON(data: safeData) {
                        let formattedPrice = String(format: "%.2f", bitcoinPrice)
                        // Send data to main view controller
                        self.delegate?.didUpdatePrice(price: formattedPrice, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            // Decoded data
            let decodedData = try decoder.decode(CoinData.self, from: data)
            // Save price
            let price = decodedData.rate
            return price
        } catch {
            // Print error and return nothing
            print(error)
            return nil
        }
    }
}
