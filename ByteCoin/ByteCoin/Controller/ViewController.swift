//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    
    // Needed connections
    @IBOutlet var bitcoinLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        // Get price on app launch
        coinManager.getCoinPrice(for: "USD")
    }
}

extension ViewController: CoinManagerDelegate {
    // Update the labels after completing the api call
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = "\(price)"
            self.currencyLabel.text = "\(currency)"
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // Specify number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Get number of rows from count value of currency array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    // Assign titles to each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

