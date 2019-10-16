//
//  GameDetail.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 27/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation
import WatchKit

class GameDetail: Codable, Identifiable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id
        case points = "points"
        case time = "time"
//        case bbteam1 = "bbteam1"
//        case bbteam2 = "bbteam2"
//        case event = "event"
//        case name = "name"
//        case event = "event"
        case bbOne = "bbOne"
        case bbTwo = "bbTwo"
        case scoreA = "scoreA"
        case scoreB = "scoreB"
    }

    let id: Int
    let points: [CGFloat]
    let time: String
//    let bbteam1: [CGFloat]
//    let bbteam2: [CGFloat]
//    let event: [SpecialEvent]
//    let name : String
//    let event : String
    let bbOne: CGFloat
    let bbTwo: CGFloat
    let scoreA: Int
    let scoreB: Int
    
    var lastPoint: CGFloat {
        return points.last ?? 0
    }
    
    var averageExcitement: CGFloat {
        _ = points[points.count-1]
        _ = points.last ?? 0.0
        //let result =  (a / b) - 0.1
        return points.last ?? 0
    }

    var description: String {
        return "points: \(points) time: \(time)"
    }
    
    init() {
        self.id = 0
        self.points = [0.1]
        self.time = "0"
//        self.bbteam1 = [0,1]
//       self.bbteam2 = [0,1]
//        self.event = [SpecialEvent]()
//        self.name = ""
//        self.event = ""
        self.bbOne = 0.4
        self.bbTwo = 0.6
        self.scoreA = 0
        self.scoreB = 0
    }
}
