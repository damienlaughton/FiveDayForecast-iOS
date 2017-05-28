//
//  Forecast.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

struct Forecast {
  var date:Date = Date()
  var temperatures:[Double] = []
  var descriptions:[String] = []
  
  func isEmpty() -> Bool {
    var isEmpty = true
    
    if (temperatures.count > 0) {
      isEmpty = false
    }
    
    return isEmpty
  }
  
  mutating func append(temperature: Double, description: String) {
    self.temperatures.append(temperature)
    self.descriptions.append(description)
  }
}
