//
//  ForecastCell.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit
import Foundation

class ForecastCell: UICollectionViewCell {
  
  @IBOutlet weak var dateLabel: UILabel!
  
  func configure(forecast: Forecast) {
    let datetext = DateManagerSingleton.sharedInstance.formatter_ddMMYY().string(from: forecast.date)
    self.dateLabel.text = datetext
  }
}
