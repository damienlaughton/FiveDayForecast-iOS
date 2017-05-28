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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.removeLogo()
  }
  
  //MARK:- Animation Method(s)
  
  func removeLogo(animated: Bool = true, completionHandler: @escaping AnimationCompletionHandler = { _ in }) {
    
    guard let fivedayForecastLogoImageView = self.fivedayForecastLogoImageView else { return }
    
    if (!animated) {
      fivedayForecastLogoImageView.alpha = 0.0
      completionHandler(true)
      return
    }
    
    UIView.animate(withDuration:0.3, delay: 0.0, options: .curveEaseInOut,
                   animations: {
                    fivedayForecastLogoImageView.alpha = 0.0
    },
                   completion: { finished in
                    completionHandler(true)
    })
    
  }
  
  
}

