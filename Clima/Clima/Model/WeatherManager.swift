//
//  WeatherManager.swift
//  Clima
//
//  Created by Tony Alhwayek on 9/30/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e6051d2d9618cf9c3e7271362c5fc78f&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    // If user searched for a location
    // Get weather data using the city's name
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    // If user gave location permissions
    // Get weather data using their latitude and longitude
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    // Perform request using city name
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URL session
            let session = URLSession(configuration: .default)
            // 3. Give session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    // Parse the API request's returned data
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
