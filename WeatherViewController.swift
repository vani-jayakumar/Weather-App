//
//  WeatherViewController.swift
//  Weather App
//
//  Created by Vani on 10/7/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var weatherLabel:UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherLabel.text = " "
        temperatureLabel.text = " "
        feelsLikeLabel.text = " "
        humidityLabel.text = " "
    }
    @IBAction private func didTapSearch(button: UIButton){
        guard  let city = cityTextField.text,!city.isEmpty else {
            return
        }
        fetchWeatherForCity(for: city)
    }
    private func fetchWeatherForCity(for city: String){
        weatherService.fetchWeather(for: city) {[weak self] weather in
            DispatchQueue.main.async {
                if let weather = weather{
                    self?.updateUI(with: weather)
                } else{
                    self?.weatherLabel.text = "Weather not found!"
                    self?.temperatureLabel.text = " "
                    self?.feelsLikeLabel.text = " "
                    self?.humidityLabel.text = " "
                }
            }
        }
    }
    private func updateUI(with weather: Weather){
        weatherLabel.text = "\(weather.weather.first?.description.capitalized ?? " ")"
        temperatureLabel.text = "Temperature: \(weather.main.temp) \u{00B0}C "
        feelsLikeLabel.text = "Feels LIke: \(weather.main.feelsLike) \u{00B0}C "
        humidityLabel.text = "Humidity: \(weather.main.humidity) % "
    }
}
