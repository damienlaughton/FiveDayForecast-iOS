//
//  APIManagerSingleton+FiveDayForecast.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

extension APIManagerSingleton {
  
<<<<<<< HEAD
  func performFiveDayForecast(cityName: String, countryCode: String = "GB", completion: @escaping APICompletionHandler) {
=======
  func performFiveDayForecast(cityName: String, countryCode: String = "UK", completion: @escaping APICompletionHandler) {
>>>>>>> b2938fa3d1fb23ce11bcee6692a948e2757ee120
  
    let query: String = "forecast?q=\(cityName),\(countryCode)"
    
    performRequest(url: URLRootDevelopment.appending(query), httpMethod: "GET", httpBodyParameters: .none, headerParameters: .none , completion: completion)
  }
}
