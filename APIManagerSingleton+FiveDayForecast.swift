//
//  APIManagerSingleton+FiveDayForecast.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

extension APIManagerSingleton {
  
  func performFiveDayForecast(cityName: String, countryCode: String = "GB", completion: @escaping APICompletionHandler) {

  
    let query: String = "forecast?q=\(cityName),\(countryCode)"
    
    performRequest(url: URLRootDevelopment.appending(query), httpMethod: "GET", httpBodyParameters: .none, headerParameters: .none , completion: completion)
  }
}
