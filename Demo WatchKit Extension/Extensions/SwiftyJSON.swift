//
//  SwiftyJSON.swift
//  Demo WatchKit Extension
//
//  Created by Bas van Kuijck on 26/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    func map<T: Decodable>(to type: T.Type, with builder: ((JSONDecoder) -> Void)? = nil) throws -> T {
        let jsonDecoder = JSONDecoder()
        builder?(jsonDecoder)
        let data = try rawData()
        return try jsonDecoder.decode(type, from: data)
    }
}
