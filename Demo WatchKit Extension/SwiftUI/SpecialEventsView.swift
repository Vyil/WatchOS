//
//  SpecialEventsView.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 01/10/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import SwiftUI

struct SpecialEventsView: View {
    
    @ObservedObject var apiManager = APIManager()
    
    let events : SpecialEvent
    
    var body: some View {
        HStack{
            if events.event == "red" {
                Image("rood")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:22, height:12, alignment: .center)
                    .cornerRadius(12)
                    .clipped()
            } else if events.event == "yellow"{
                Image("geel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:22, height:12, alignment: .center)
                    .cornerRadius(12)
                    .clipped()
            } else if events.event == "corner"{
                Image("corner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:22, height:12, alignment: .center)
                    .cornerRadius(12)
                    .clipped()
            } else if events.event == "penalty"{
                Image("penalty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:22, height:12, alignment: .center)
                    
                    .clipped()
            } else if events.event == "goal"{
                Image("goal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:22, height:12, alignment: .center)
                    .clipped()
                    
            }
            Text(events.name)
                .font(.footnote)
                .fontWeight(Font.Weight.light)
                .frame(width:110, height:10, alignment: .leading)
            
            Text(events.time+"\'")
            .font(.footnote)
            .fontWeight(Font.Weight.light)
            .frame(width:100, height:10, alignment: .leading)
           
        }.frame(alignment: .center)//.listRowBackground(Color.black)
            
            
    }
}

//struct SpecialEventsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialEventsView()
//    }
//}
