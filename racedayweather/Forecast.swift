//
//  Forecast.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

struct Forecast {
  var dates:[Date] = []
  var temperatures:[Double] = []
  var descriptions:[String] = []
  
  func isEmpty() -> Bool {
    var isEmpty = true
    
    if (temperatures.count > 0) {
      isEmpty = false
    }
    
    return isEmpty
  }
  
  mutating func append(date: Date, temperature: Double, description: String) {
    self.dates.append(date)
    self.temperatures.append(temperature)
    self.descriptions.append(description)
  }
  
  func isSameDate(date: Date) -> Bool {
    var isSameDate = false
    
    if (self.dates.count > 0) {
      if let currentDate = self.dates.first {
    
        isSameDate = (Calendar.current.isDate(date, inSameDayAs:currentDate))
      }
    }
    return isSameDate;
  }
  
  func dateDescription() -> String {
    if let date = self.dates.first {
      return DateManagerSingleton.sharedInstance.formatter_ddMMYY().string(from: date)
    }
    
    return ""
  }
  
  func temperatureDescription(index:Int) -> String {
    if (index > self.dates.count - 1) {
      return ""
    }
    
    let time = DateManagerSingleton.sharedInstance.formatter_ddMMYY().string(from: self.dates[index])

    let formatter = MeasurementFormatter()
    formatter.locale = Locale(identifier: "en_GB")
    let measurement = Measurement(value: self.temperatures[index], unit: UnitTemperature.celsius)
    let temperature = formatter.string(from: measurement)
    
    let description = self.descriptions[index]
    
    let temperatureDescription = "\(time) \(temperature) \(description)"
    
    return temperatureDescription
    
  }
}
