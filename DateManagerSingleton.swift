//
//  DateManagerSingleton.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

public class DateManagerSingleton {
  
  private init() {
  }
  
  deinit {
  }
  
  static let sharedInstance = DateManagerSingleton()
  
  private static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.locale = Locale.current
    return formatter
  } ()
  
  func formatter_ddMMYY () -> DateFormatter {
    let formatter_ddMMYY = DateManagerSingleton.formatter
    formatter_ddMMYY.dateFormat = "dd/MM/YY"
    
    return formatter_ddMMYY
  }
  
  func formatter_HHmm () -> DateFormatter {
    let formatter_HHmm = DateManagerSingleton.formatter
    formatter_HHmm.dateFormat = "HH:mm"
    
    return formatter_HHmm
  }
  
}

