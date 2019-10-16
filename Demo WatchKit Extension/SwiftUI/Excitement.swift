//
//  Excitement.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 25/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import SwiftUI
import Combine

struct Excitement: View {
    
    @ObservedObject var apiManager = APIManager()
    
    var body: some View {
        VStack{
            HStack{
                List{
                    ForEach(apiManager.events) {
                        event in SpecialEventsView(events: event)
                    }
                }.frame(width:200, height:55, alignment: .center)
                    .offset(x: 0, y:10)
                
            }
        }
    }
}

struct Excitement_Previews: PreviewProvider {
    static var previews: some View {
        Excitement()
    }
}
