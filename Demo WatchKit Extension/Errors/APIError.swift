//
//  APIError.swift
//  Demo WatchKit Extension
//
//  Created by Bas van Kuijck on 26/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation

enum APIError: Error {
    case unknown
    case underlying(Error)
}
