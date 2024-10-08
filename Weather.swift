//
//  Weather.swift
//  Weather App
//
//  Created by Vani on 10/7/24.
//

import Foundation

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let humidity: Int
    
    enum CodingKeys:String, CodingKey{
        case temp, humidity
        case feelsLike = "feels_like"
    }
}

struct WeatherCondition: Codable {
    let description : String
}

struct Weather: Codable {
    let main: Main
    let weather: [WeatherCondition]
}
