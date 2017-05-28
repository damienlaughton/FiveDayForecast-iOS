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
      let temp: [Forecast] = self.forecasts(weather: self.latestWeatherForSantaPod)
      return temp
  }
  
  var latestWeatherForSantaPod: JSON = [:] {
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
  
  private func forecasts(weather: JSON) -> [Forecast] {
    return []
  }

}
