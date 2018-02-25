//
//  WeatherService.swift
//  GoogleWeather
//
//  Created by Frederick C. Lee on 2/7/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class WeatherReport {
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
    
    struct WeatherData {
        let name:String
        let description:String
        let currentTemp:String
        let minTemp:String
        let maxTemp:String
        let humidity:String
        let windSpeed:String
        let windDirection:String
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
              windSpeed:String,
              windDirection:String,
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
            self.windSpeed = windSpeed
            self.windDirection = windDirection
            self.barometer = barometer
            self.visibility = visibility
            self.sunrise = visibility
            self.sunset = sunset
        }
    }
    
    final class func disseminateJSON(data: Data) -> DataListModel? {
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
    
    struct WeatherResource {
        let url:URL
        let parse:(Data) -> Data?
    }
    
    
    final class func load(resource: WeatherResource, completion: @escaping (Any?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { (data, _, error) in
            if let error = error {
                completion(error.localizedDescription)
            } else if let data = data {
                completion(data)
            } else {
                completion(nil)
            }
            }.resume()
    }
    
    
    // -----------------------------------------------------------------------------------------------------
    
    final private class func setupDataCallback(source: DataListModel) -> WeatherData? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        func tempFahrenheit(_ fahrenheit: Float, desc: String) -> String {
            let tempF  = formatter.string(from: NSNumber(value:fahrenheit))
            return "\(tempF!) deg F. \(desc)"
        }
        
        func windSpeed(speed: Float) -> String {
            let windSpeed  = formatter.string(from: NSNumber(value:speed))
            return "\(String(describing: windSpeed)) m.p.h"
        }
        
        func windDirection(deg: Float) -> String {
            return "\(deg) degrees"
        }
        
        func humidity(hum: Float) -> String {
            return "\(hum)% Relative Humidity"
        }
        
        func pressure(_ press: Float) -> String {
            let mmHG = press/1.33322387415
            return  "\(formatter.string(from: NSNumber(value:mmHG))!) mm HG"
        }
        
        func visibility(meters: Double) -> String {
            let feet = meters * 3.2808399
            let feetStr  = formatter.string(from: NSNumber(value:feet))!
            return "\(feetStr) feet"
        }
        
        func HNLTime(UTC: Double, desc: String) -> String {
            return "\(UTC) \(desc) Local time <--to do"
        }
        
        
        return WeatherData (name:source.name,
                            description:source.weather[0].description,
                            currentTemp:tempFahrenheit(source.main.temp, desc: "current"),
                            minTemp:tempFahrenheit(source.main.temp_min, desc: "min"),
                            maxTemp:tempFahrenheit(source.main.temp_max, desc: "max"),
                            humidity:humidity(hum: source.main.humidity),
                            windSpeed:windSpeed(speed: source.wind.speed),
                            windDirection:windDirection(deg: source.wind.deg),
                            barometer:pressure(source.main.pressure),
                            visibility:visibility(meters: source.visibility),
                            sunrise:HNLTime(UTC: source.sys.sunrise, desc: "Sunrise"),
                            sunset:HNLTime(UTC: source.sys.sunset, desc: "Sunset"))
        
    }
    
    
    final class func getWeatherData(sender: MainViewController, completion:@escaping (WeatherData?)->Void)  {
        // Hawaii ID = '5856194'
        // Units: Imperial
        let weatherURIString = "https://api.openweathermap.org/data/2.5/weather?id=5856194&APPID=44d0f6b3ed7092adb89091cbed5372b4&units=imperial"
        let url = URL(string:weatherURIString)
        
        let weatherResource = WeatherResource(url: url!) {(data) -> Data? in
            return data
        }
        self.load(resource: weatherResource) {result in
            DispatchQueue.main.async(execute: {
                if let errorDescription = result as? String {
                    print(errorDescription)
                } else if let jsonData = result as? Data {
                    completion(setupDataCallback(source: self.disseminateJSON(data: jsonData)!))
                    
                }
            })
        }
    }
}

















