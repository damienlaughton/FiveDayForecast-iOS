//
//  ForecastCell.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit
import Foundation

class ForecastCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  

  var forecast: Forecast?
  
  
  func configure(forecast: Forecast) {
  
    self.forecast = forecast
  
    self.dateLabel.text = self.forecast?.dateDescription()
    
    self.tableView.reloadData()
    
  }
  
  //MARK:- UITableViewDelegate/DataSource Method(s)
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastDetailTableViewCell", for: indexPath)
    
    cell.textLabel?.text = self.forecast?.temperatureDescription(index: indexPath.row)
    
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numberOfRows = 0
    
    if let _forecast = self.forecast {
      numberOfRows = _forecast.temperatures.count
    }
    
    return numberOfRows
 }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: false)
  }

}
