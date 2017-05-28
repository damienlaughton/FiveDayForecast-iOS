//
//  GlobalDefinitions.swift
//  racedayweather
//
//  Created by Damien Laughton on 28/05/2017.
//  Copyright © 2017 Mobilology Limited. All rights reserved.
//

import Foundation

typealias APICompletionHandler = (Data?, URLResponse?, Error?) -> ()
typealias AnimationCompletionHandler = (Bool) -> ()
typealias VoidCompletionHandler = () -> ()

typealias JSON = [String: Any]
