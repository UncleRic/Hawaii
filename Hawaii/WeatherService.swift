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
    
    func disseminateJSON(data: Data) -> DataListModel? {
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
    
    
    final func load(resource: WeatherResource, completion: @escaping (Any?) -> Void) {
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
    
    final func getWeatherData(sender: MainViewController)  {
        // Hawaii ID = '5856194'
        let weatherURIString = "https://api.openweathermap.org/data/2.5/weather?id=5856194&APPID=44d0f6b3ed7092adb89091cbed5372b4"
        let url = URL(string:weatherURIString)
        
        let weatherResource = WeatherResource(url: url!) {(data) -> Data? in
            return data
        }
        self.load(resource: weatherResource) {result in
            DispatchQueue.main.async(execute: {
                if let errorDescription = result as? String {
                    print(errorDescription)
                } else if let jsonData = result as? Data {
                    let weatherData = self.disseminateJSON(data: jsonData)
                    if let name = weatherData?.name,
                        let temp = weatherData?.main.temp,
                        let weatherDesc = weatherData?.weather[0].description {
                        let kelvinConversion = Float(273.15)
                        let celsius = NSNumber(value:Float(temp) - kelvinConversion)
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .decimal
                        formatter.maximumFractionDigits = 2
                        if let celsiusString = formatter.string(from: celsius) {
                            //    self.cityInfo = (name, celsiusString, weatherDesc)
                        }
                    }
                }
            })
        }
    }
}

















