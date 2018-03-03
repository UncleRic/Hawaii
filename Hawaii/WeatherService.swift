//
//  WeatherService.swift
//  GoogleWeather
//
//  Created by Frederick C. Lee on 2/7/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

var weatherData:WeatherData?

struct WeatherData {
    let name:String
    let description:String
    let currentTemp:String
    let minTemp:String
    let maxTemp:String
    let humidity:String
    let windSpeedAndDirection:String
    let barometer:String
    let visibility:String
    let sunrise:String
    let sunset:String
    
    init (name:String,
          description:String,
          currentTemp:String,
          minTemp:String,
          maxTemp:String,
          humidity:String,
          windSpeedAndDirection:String,
          barometer:String,
          visibility:String,
          sunrise:String,
          sunset:String) {
        self.name = name
        self.description = description
        self.currentTemp = currentTemp
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.humidity = humidity
        self.windSpeedAndDirection = windSpeedAndDirection
        self.barometer = barometer
        self.visibility = visibility
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

class WeatherService {

    // MARK: - Weather-Report Display
    
    let titleLabel:UILabel = {
        var label = UILabel(frame: CGRect.zero)
        label.text = currentIsland.description()
        label.textAlignment = .center
        label.textColor = UIColor.yellow
        label.font = UIFont(name: palatinoFont, size: 32.0)
        return label
    }()
    
    
    let weatherDescLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "Weather Description"
        label.font = UIFont(name: palatinoFont, size: 18.0)
        label.textAlignment = .center
        return label
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "current Temp."
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "Humidity"
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    let barometricLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "Barometric"
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    let windSpeedAndDirectionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "Wind Speed"
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    let sunRiseLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "SunRise"
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    let sunSetLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.yellow
        label.text = "Sun Set"
        label.font = UIFont(name: palatinoFont, size: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Raw Weather Data
    
    public struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    public struct Main: Codable {
        let temp: Float
        let pressure: Float
        let humidity: Float
        let temp_min: Float
        let temp_max: Float
    }
    
    public struct Wind: Codable {
        let speed: Float
        let deg: Float
    }
    
    public struct Clouds: Codable {
        let all: Int
    }
    
    public struct Sys: Codable {
        let type: Int
        let id: Int
        let message: Double
        let country: String
        let sunrise: Double
        let sunset: Double
    }
    
    struct DataListModel: Codable {
        let coord : [String:Float]
        let weather : [Weather]
        let base: String
        let main: Main
        let visibility: Double
        let wind: Wind
        let clouds: [String:Int]
        let dt: Double
        let sys: Sys
        let id: Int
        let name: String
        let cod: Int
    }
    
    
    private func disseminateJSON(data: Data) -> DataListModel? {
        var weatherStuff:DataListModel?
        do {
            weatherStuff = try JSONDecoder().decode(DataListModel.self, from: data)
        } catch let error as NSError {
            let title = "JSON Dissemination Error"
            let alert = UIAlertController(title: title, message: error.debugDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: nil))
            //   self.present(alert, animated: true, completion: nil)
        }
        return weatherStuff
    }
    
    // ===================================================================================================
    // MARK: - private functions
    
    //TODO: convert deg to nav pointers.
    //    fileprivate func convertDegToString(deg: String) -> String {
    //          let degFloat = Float(deg)
    //
    //            return ""
    //    }
    private func setupDataCallback(source: DataListModel) -> WeatherData? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        func tempFahrenheit(_ fahrenheit: Float) -> String {
            if let tempF  = formatter.string(from: NSNumber(value:fahrenheit)) {
                return "\(tempF) deg F."
            }
            return " "
        }
        
        func windSpeedAndDirection(speed: Float, deg:Float) -> String {
            if let windSpeed  = formatter.string(from: NSNumber(value:speed)) {
                return "Wind Speed: \(windSpeed) mph at \(deg) degrees"
            }
            return "Calm"
        }
        
        func humidity(hum: Float) -> String {
            return "\(hum)% Relative Humidity"
        }
        
        func pressure(_ press: Float) -> String {
            let mmHG = press/1.33322387415
            return  "Barometer: \(formatter.string(from: NSNumber(value:mmHG))!) mm HG"
        }
        
        func visibility(meters: Double) -> String {
            let feet = meters * 3.2808399
            let feetStr  = formatter.string(from: NSNumber(value:feet))!
            return "\(feetStr) feet"
        }
        
        func HNLTime(UTC: Double, desc: String) -> String {
            return "\(UTC) \(desc) Local time <--to do"
        }
        
       
        weatherData =  WeatherData (name:source.name,
                            description:source.weather[0].description,
                            currentTemp:tempFahrenheit(source.main.temp),
                            minTemp:tempFahrenheit(source.main.temp_min),
                            maxTemp:tempFahrenheit(source.main.temp_max),
                            humidity:humidity(hum: source.main.humidity),
                            windSpeedAndDirection:windSpeedAndDirection(speed: source.wind.speed, deg: source.wind.deg),
                            barometer:pressure(source.main.pressure),
                            visibility:visibility(meters: source.visibility),
                            sunrise:HNLTime(UTC: source.sys.sunrise, desc: "Sunrise"),
                            sunset:HNLTime(UTC: source.sys.sunset, desc: "Sunset"))
        
        return weatherData
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    private func setupWeatherReport(sender: UIViewController) {
        guard let hostView = sender.view else {
            return
        }
        
        let containerView = UIView(frame:CGRect.zero)
        containerView.tag = IslandAssets.assetsContainerView.rawValue
        hostView.addSubview(containerView)
        
        containerView.anchor(top: hostView.safeAreaLayoutGuide.topAnchor,
                             bottom: hostView.safeAreaLayoutGuide.bottomAnchor,
                             left: hostView.safeAreaLayoutGuide.leftAnchor,
                             right: hostView.safeAreaLayoutGuide.rightAnchor,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: 100,
                             paddingLeft: 20,
                             paddingBottom: -350,
                             paddingRight: -20, width: 0, height: 0)
        
        let x:CGFloat = 10.0; let y:CGFloat = 40.0
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(weatherDescLabel)
        containerView.addSubview(temperatureLabel)
        containerView.addSubview(humidityLabel)
        containerView.addSubview(barometricLabel)
        containerView.addSubview(windSpeedAndDirectionLabel)
        containerView.addSubview(sunRiseLabel)
        containerView.addSubview(sunSetLabel)
        
        // Title:
        titleLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                          bottom: nil,
                          left: nil,
                          right: nil,
                          centerYAnchor: nil,
                          centerXAnchor: containerView.safeAreaLayoutGuide.centerXAnchor,
                          paddingTop: 0,
                          paddingLeft: x,
                          paddingBottom: 0,
                          paddingRight: 0, width: 200, height: 38)
        
        // Weather:
        weatherDescLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                                bottom: nil,
                                left: containerView.safeAreaLayoutGuide.leftAnchor,
                                right: containerView.safeAreaLayoutGuide.rightAnchor,
                                centerYAnchor: nil,
                                centerXAnchor: nil,
                                paddingTop: y,
                                paddingLeft: 0,
                                paddingBottom: 0,
                                paddingRight: 0, width: 0, height: 24)
        
        // Current Temperature:
        temperatureLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                                bottom: nil,
                                left: containerView.safeAreaLayoutGuide.leftAnchor,
                                right: containerView.safeAreaLayoutGuide.rightAnchor,
                                centerYAnchor: nil,
                                centerXAnchor: nil,
                                paddingTop: y+32,
                                paddingLeft: 0,
                                paddingBottom: 0,
                                paddingRight: 0, width: 0, height: 18)
        
        // Humidity:
        humidityLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             left: containerView.safeAreaLayoutGuide.leftAnchor,
                             right: nil,
                             centerYAnchor: nil,
                             centerXAnchor: nil,
                             paddingTop: y+32*2,
                             paddingLeft: 0,
                             paddingBottom: 0,
                             paddingRight: 0, width: 225, height: 18)
        
        // Barometric:
        barometricLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                               bottom: nil,
                               left: containerView.safeAreaLayoutGuide.leftAnchor,
                               right: containerView.safeAreaLayoutGuide.rightAnchor,
                               centerYAnchor: nil,
                               centerXAnchor: nil,
                               paddingTop: y+32*3,
                               paddingLeft: 0,
                               paddingBottom: 0,
                               paddingRight: 0, width: 0, height: 18)
        
        // Wind Speed & Direction:
        windSpeedAndDirectionLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                                          bottom: nil,
                                          left: containerView.safeAreaLayoutGuide.leftAnchor,
                                          right: containerView.safeAreaLayoutGuide.rightAnchor,
                                          centerYAnchor: nil,
                                          centerXAnchor: nil,
                                          paddingTop: y+32*4,
                                          paddingLeft: 0,
                                          paddingBottom: 0,
                                          paddingRight: 0, width: 0, height: 18)
        
        
        // Sun Rise:
        sunRiseLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                            bottom: nil,
                            left: containerView.safeAreaLayoutGuide.leftAnchor,
                            right: containerView.safeAreaLayoutGuide.rightAnchor,
                            centerYAnchor: nil,
                            centerXAnchor: nil,
                            paddingTop: y+32*5,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            paddingRight: 0, width: 200, height: 18)
        
        
        // Sun Set:
        sunSetLabel.anchor(top: containerView.safeAreaLayoutGuide.topAnchor,
                           bottom: nil,
                           left: containerView.safeAreaLayoutGuide.leftAnchor,
                           right: containerView.safeAreaLayoutGuide.rightAnchor,
                           centerYAnchor: nil,
                           centerXAnchor: nil,
                           paddingTop: y+32*6,
                           paddingLeft: 0,
                           paddingBottom: 0,
                           paddingRight: 0, width: 0, height: 18)
        
    }
    
    
    // ===================================================================================================
    
    private func getWeatherData(completion:@escaping (WeatherData?)->Void)  {
        // Hawaii ID = '5856194'
        // Units: Imperial
        let weatherURIString = "https://api.openweathermap.org/data/2.5/weather?id=5856194&APPID=44d0f6b3ed7092adb89091cbed5372b4&units=imperial"
        
        if let url = URL(string:weatherURIString) {
            
            URLSession.shared.dataTask(with:url) { (data, response, error) in
                DispatchQueue.main.async(execute: {
                    if let error = error {
                        print(error)
                    } else if let data = data {
                        if let disseminatedJSON = self.disseminateJSON(data: data) {
                            completion(self.setupDataCallback(source: disseminatedJSON))
                        } else {
                            completion(nil)
                        }
                        
                    }
                })
                
                }.resume()
        }
    }
    
    // ===================================================================================================
    
    func displayWeatherReport(sender: UIViewController) {
        setupWeatherReport(sender: sender)
        if let weatherData = weatherData {
            self.weatherDescLabel.text = weatherData.description
            let currentTemp = weatherData.currentTemp; let minTemp = weatherData.minTemp; let maxTemp = weatherData.maxTemp
                self.temperatureLabel.text = "Currently: \(currentTemp); low: \(minTemp), high: \(maxTemp)"
            
            self.humidityLabel.text = weatherData.humidity
            self.barometricLabel.text = weatherData.barometer
            self.windSpeedAndDirectionLabel.text = weatherData.windSpeedAndDirection
            self.sunRiseLabel.text = weatherData.sunrise
            self.sunSetLabel.text = weatherData.sunset
            return
        }
        getWeatherData() {weatherData in
            self.weatherDescLabel.text = weatherData?.description
            if let currentTemp = weatherData?.currentTemp, let minTemp = weatherData?.minTemp, let maxTemp = weatherData?.maxTemp {
                self.temperatureLabel.text = "Currently: \(currentTemp); low: \(minTemp), high: \(maxTemp)"
            }
            self.humidityLabel.text = weatherData?.humidity
            self.barometricLabel.text = weatherData?.barometer
            self.windSpeedAndDirectionLabel.text = weatherData?.windSpeedAndDirection
            self.sunRiseLabel.text = weatherData?.sunrise
            self.sunSetLabel.text = weatherData?.sunset
        }
        
    }
}















