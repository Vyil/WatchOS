//
//  GraphView.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 01/10/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    
    @ObservedObject var apiManager = APIManager()
    
    var body: some View {
        HStack{
            Path{ path in
                var startY = 0
                var startX = 200
                
                apiManager.gameDetail.points.forEach{ point in
                    let convertedY = Int(point * 20)
                    
                    path.move(to: CGPoint(x:startX,y:startY))
                    path.addLine(to: CGPoint(x:startX-20,y:convertedY-1))
                    path.addLine(to: CGPoint(x:startX-20,y:convertedY))
                    path.addLine(to: CGPoint(x:startX,y:startY+1))
                    startY = convertedY-1
                    startX -= 20
                }
                
            }.fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topTrailing, endPoint: .bottom))
        }.offset(x:0, y:-7).animation(.default).rotationEffect(.degrees(180))
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
