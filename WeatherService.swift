//
//  WeatherService.swift
//  Weather App
//
//  Created by Vani on 10/7/24.
//

import Foundation

class WeatherService {
    private let apiKey = "0ec2c68b3e64b4a91c712fbab80535b2"
    func fetchWeather(for city: String, callBack: @escaping (Weather?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            callBack(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                callBack(nil)
                return
            }
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                callBack(weather)
            } catch let error {
                print(error.localizedDescription)
                callBack(nil)
            }
        }).resume()
    }
}
