//
//  WeatherManager.swift
//  Clima
//
//  Created by Tiger Mei on 31.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "api.openweathermap.org/data/2.5/weather?appid=09c164a40fe5bc3e9e17473a70356c81&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
