//
//  ApplicationDataManager.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

public class ApplicationDataManager {
  
  static let sharedInstance = ApplicationDataManager()
  
  var VM_latestWeatherForSantaPad: [Forecast] {
      let temp: [Forecast] = self.forecast(weather: self.latestWeatherForSantaPod)
      return temp
  }
  
  private var latestWeatherForSantaPod: JSON = [:] {
    didSet {
      NotificationCenter.default.post(name: .WeatherInformationUpdated, object: self.VM_latestWeatherForSantaPad)
    }
  }
  
  func updateWeatherInformationForSantaPod() {
    APIManagerSingleton.sharedInstance.performFiveDayForecast(cityName: "Podington") { [unowned self] data, response, error in
      DispatchQueue.main.async {
        
        print("\(self)")
        let validStatusCode = response?.isValidStatusCode() ?? false
        
        if (nil != error) {
          //error clause
          print(error ?? "Unknown error")
        } else if (false == validStatusCode) {
          // invalid server status
        } else {
          //we're good
          
          guard let json = data?.json() else { return }
          
          self.latestWeatherForSantaPod = json
          
          
        }
      }
    }
  }
  
  private func forecast(weather: JSON) -> [Forecast] {
  
    var forecast: [Forecast] = []
    
    var lastForecastItem: Forecast = Forecast()
    
    if let list = weather["list"] as? [JSON] {
    

      
      for listItem in list {
      
        let timeInterval = listItem["dt"] as? TimeInterval ?? 0
        let date = Date(timeIntervalSince1970: timeInterval)
        var temperature = 0.0
        if let main = listItem["main"] as? JSON {
          if let _temperature = main["temp"] as? Double {
            temperature = _temperature
          }
        }
        var description = ""
        if let weather = listItem["weather"] as? [JSON] {
          if let _weatherZero = weather.first {
            let _weatherMain = _weatherZero["main"] as? String ?? ""
            let _weatherDescription = _weatherZero["description"] as? String ?? ""
            description = "\(_weatherMain) (\(_weatherDescription))"
          }
        }
        
        if (lastForecastItem.isEmpty()) {
          lastForecastItem.date = date
          lastForecastItem.append(temperature: temperature, description: description)
        } else if (Calendar.current.isDate(date, inSameDayAs:lastForecastItem.date)) {
          lastForecastItem.append(temperature: temperature, description: description)
        } else {
          forecast.append(lastForecastItem)
          lastForecastItem = Forecast()
          lastForecastItem.date = date
          lastForecastItem.append(temperature: temperature, description: description)
        }
        
      }
      
      forecast.append(lastForecastItem)
      
    }
  
    return forecast
  }

}
