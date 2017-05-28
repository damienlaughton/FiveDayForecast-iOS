//
//  DidFinishLaunchingViewController.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit

class DidFinishLaunchingViewController: RootViewController, UIWeatherReportViewDelegate {
  
  @IBOutlet weak var fivedayForecastLogoImageView: UIImageView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var weatherReportView: UIWeatherReportView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(respondToWeatherInformationUpdated), name: .WeatherInformationUpdated, object: nil)

  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func configure() {
    super.configure()
    
    self.weatherReportView.delegate = self
    
    self.weatherReportView.configure(forecast: ApplicationDataManager.sharedInstance.VM_latestWeatherForSantaPad)
    
    self.preConfigureViews()
    
    self.removeLogo(completionHandler: { _ in
      self.showWeatherReportView(completionHandler: { _ in
        self.showPageControl()
      })
    })
  }
  
  @objc private func respondToWeatherInformationUpdated(note: NSNotification) {
  
    if let newForecast = note.object as? [Forecast] {
      self.weatherReportView.configure(forecast: newForecast)
      self.pageControl.numberOfPages = newForecast.count
    } else {
       self.weatherReportView.configure(forecast: ApplicationDataManager.sharedInstance.VM_latestWeatherForSantaPad)
       self.pageControl.numberOfPages = ApplicationDataManager.sharedInstance.VM_latestWeatherForSantaPad.count
    }
  }
  
  func preConfigureViews() {
  
    guard let fivedayForecastLogoImageView = self.fivedayForecastLogoImageView else { return }
    guard let pageControl = self.pageControl else { return }
    guard let weatherReportView = self.weatherReportView else { return }
    
    fivedayForecastLogoImageView.alpha = 1.0
    pageControl.alpha = 0.0
    weatherReportView.alpha = 0.0
  }
  
  //MARK:- UIWeatherReportViewDelegate
  
  func forecastDisplayed(index: Int) {
    self.pageControl.currentPage = index
  }
  
}

