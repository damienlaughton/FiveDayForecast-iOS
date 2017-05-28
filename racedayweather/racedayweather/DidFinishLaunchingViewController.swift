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
    
    self.removeLogo(completionHandler: { _ in
      self.showWeatherReportView(completionHandler: { _ in
        self.showPageControl()
      })
    })
  }
  
  
}

