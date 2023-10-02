//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    

    
}

//MARK: - UITextFieldDelegate

// Moved everything dealing with TextFieldDelegate down here
// Makes the code look cleaner
extension WeatherViewController: UITextFieldDelegate {
    // When search button (near search bar) is pressed
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    // When user presses blue button on keyboard (currently "go")
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    // Check if search bar is empty (or not)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type something..."
            return false
        }
    }
    
    // When search is pressed
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Check for city name and fetch data using api
        if let city = searchTextField.text {
            let fixedCityName = city.replacingOccurrences(of: " ", with: "+")
            weatherManager.fetchWeather(cityName: fixedCityName)
        }
        
        // Clear search bar after search
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
// Weather Manager extension
extension WeatherViewController: WeatherManagerDelegate {
    // Whenever the API call finishes successfully
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            // Update UI with data from API call
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    // When an error occurs
    func didFailWithError(error: Error) {
        print(error)
    }
}
