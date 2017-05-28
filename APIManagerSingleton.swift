//
//  APIManagerSingleton.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

public class APIManagerSingleton {

  static let sharedInstance = APIManagerSingleton()

  var URLRootDevelopment: String { return "http://api.openweathermap.org/data/2.5/" }
  
  private init() {
  }
  
  deinit {
  }
  
  func performRequest(url: String, httpMethod: String, httpBodyParameters: JSON? = .none, headerParameters: JSON? = .none, completion: @escaping APICompletionHandler) {
  
    // bd8c011cc1437bb97815745edcece6d1 - appid
    let urlWithExtraParameters = "\(url)&mode=json&appid=bd8c011cc1437bb97815745edcece6d1"
    
    guard let requestURL = URL(string: urlWithExtraParameters) else { return }
    
    var mutableRequest = URLRequest(url: requestURL)
    mutableRequest.httpMethod = httpMethod
    mutableRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    if let params = httpBodyParameters, let jsonData = try? JSONSerialization.data(withJSONObject: params) {
      
      mutableRequest.httpBody = jsonData
    }
    
    if let headers = headerParameters {
      for (key, _value) in headers {
        if let value = _value as? String {
          mutableRequest.setValue(value, forHTTPHeaderField: key)
        }
        
      }
    }
    
    URLSession.shared.dataTask(with: mutableRequest, completionHandler: completion).resume()
  }

}
