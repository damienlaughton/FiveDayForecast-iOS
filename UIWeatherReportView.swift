//
//  UIWeatherReportView.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class UIWeatherReportView: UIView {

  func configure(forecast: [Forecast]) {
    
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

}
