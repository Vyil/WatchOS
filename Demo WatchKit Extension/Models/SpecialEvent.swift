//
//  SpecialEvent.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 01/10/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation
import WatchKit

class SpecialEvent: Codable, Identifiable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case event = "event"
        case time = "time"
    }

    let name : String
    let event : String
    let time : String
    

    var description: String {
        return "Name: \(name) Event: \(event)"
    }
    
    init() {
        self.name = ""
        self.event = ""
        self.time = ""
    }
}

