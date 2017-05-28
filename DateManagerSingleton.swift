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
  
  func formatter_ddMMyyyy_HHmmss () -> DateFormatter {
    let formatter_ddMMyyyy_HHmmss = DateManagerSingleton.formatter
    formatter_ddMMyyyy_HHmmss.dateFormat = "dd/MM/yyyy HH:mm:ss"
    
    return formatter_ddMMyyyy_HHmmss
  }
  
  func formatter_yyyyMMdd_HHmmss () -> DateFormatter {
    let formatter_yyyyMMdd_HHmmss = DateManagerSingleton.formatter
    formatter_yyyyMMdd_HHmmss.dateFormat = "yyyyMMdd_HHmmss"
    
    return formatter_yyyyMMdd_HHmmss
  }
  
  func formatter_ddMMyyyy_HHmm () -> DateFormatter {
    let formatter_ddMMyyyy_HHmm = DateManagerSingleton.formatter
    formatter_ddMMyyyy_HHmm.dateFormat = "dd/MM/yyyy HH:mm"
    
    return formatter_ddMMyyyy_HHmm
  }
  
}

