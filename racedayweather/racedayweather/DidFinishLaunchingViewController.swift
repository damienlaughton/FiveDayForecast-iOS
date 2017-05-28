//
//  DidFinishLaunchingViewController.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit

class DidFinishLaunchingViewController: RootViewController {
  
  @IBOutlet weak var fivedayForecastLogoImageView: UIImageView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var weatherReportView: UIWeatherReportView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    APIManagerSingleton.sharedInstance.performFiveDayForecast(cityName: "Podington") { [unowned self] data, response, error in
      DispatchQueue.main.async {
      
        print("\(self)")
        let validStatusCode = response?.isValidStatusCode() ?? false
        
        if (nil != error) {
          //error clause
          print(error)
        } else if (false == validStatusCode) {
          // invalid server status
        } else {
          //we're good
          
          guard let json = data?.json() else { return }
          
          print(json)
          
        }
      }
    }

  }
  
  override func configure() {
    super.configure()
    
    self.preConfigureViews()
    
    self.removeLogo(completionHandler: { _ in
      self.showWeatherReportView(completionHandler: { _ in
        self.showPageControl()
      })
    })
  }
  
  func preConfigureViews() {
  
    guard let fivedayForecastLogoImageView = self.fivedayForecastLogoImageView else { return }
    guard let pageControl = self.pageControl else { return }
    guard let weatherReportView = self.weatherReportView else { return }
    
    fivedayForecastLogoImageView.alpha = 1.0
    pageControl.alpha = 0.0
    weatherReportView.alpha = 0.0
  }
  
  
}

