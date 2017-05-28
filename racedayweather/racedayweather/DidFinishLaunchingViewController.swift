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

