//
//  DidFinishLaunching+Animation.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit

extension DidFinishLaunchingViewController {

  func removeLogo(animated: Bool = true, completionHandler: @escaping AnimationCompletionHandler = { _ in }) {
    
    guard let fivedayForecastLogoImageView = self.fivedayForecastLogoImageView else { return }
    
    if (!animated) {
      fivedayForecastLogoImageView.alpha = 0.0
      completionHandler(true)
      return
    }
    
    UIView.animate(withDuration:1.0, delay: 0.0, options: .curveEaseInOut,
                   animations: {
                    fivedayForecastLogoImageView.alpha = 0.0
    },
                   completion: { finished in
                    completionHandler(true)
    })
    
  }
  
  func showPageControl(animated: Bool = true, completionHandler: @escaping AnimationCompletionHandler = { _ in }) {
    
    guard let pageControl = self.pageControl else { return }
    
    if (!animated) {
      pageControl.alpha = 1.0
      completionHandler(true)
      return
    }
    
    UIView.animate(withDuration:0.3, delay: 0.0, options: .curveEaseInOut,
                   animations: {
                    pageControl.alpha = 1.0
    },
                   completion: { finished in
                    completionHandler(true)
    })
  }
  
  func showWeatherReportView(animated: Bool = true, completionHandler: @escaping AnimationCompletionHandler = { _ in }) {
    guard let weatherReportView = self.weatherReportView else { return }
    
    if (!animated) {
      weatherReportView.alpha = 1.0
      completionHandler(true)
      return
    }
    
    UIView.animate(withDuration:0.3, delay: 0.0, options: .curveEaseInOut,
                   animations: {
                    weatherReportView.alpha = 1.0
    },
                   completion: { finished in
                    completionHandler(true)
    })
  }
  
}
