//
//  UIWeatherReportView.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class UIWeatherReportView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!

  var forecast:[Forecast] = []

  func configure(forecast: [Forecast]) {
    self.forecast = forecast
    self.collectionView.reloadData()
  }

  func configure() {
    self.backgroundColor = UIColor.red
  }
  
  override init (frame : CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.configure()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.configure()
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
//    for v in self.subviews {
//      v.removeFromSuperview()
//    }
  }
  
  override func prepareForInterfaceBuilder() {
    self.configure()
  }

//MARK: - CollectionView Delegate/Datasource Method(s)
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.forecast.count
  }
  
  func forecast(indexPath: IndexPath) -> Forecast? {
    let forecastItem = self.forecast[indexPath.row]
    
    return forecastItem
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: self.collectionView.bounds.size.width, height: CGFloat(self.collectionView.bounds.size.width))
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let forecastItem = self.forecast(indexPath: indexPath)
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as? ForecastCell
    
    cell?.configure(forecast: forecastItem ?? Forecast())
    
    return cell ?? UICollectionViewCell()
    
  }
}
