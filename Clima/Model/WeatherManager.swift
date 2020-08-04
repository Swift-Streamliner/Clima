//
//  WeatherManager.swift
//  Clima
//
//  Created by Tiger Mei on 31.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=09c164a40fe5bc3e9e17473a70356c81&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    //print(String(data: safeData, encoding: .utf8))
                    self.parseJson(weatherData: safeData)
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJson(weatherData : Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            
            let weatherModel = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
        } catch {
            print(error)
        }
    }
    
    
}
