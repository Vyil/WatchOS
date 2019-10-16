//
//  ContentView.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 25/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //    var details: GameDetails
    //    @State private var showDetail = false
    @ObservedObject var apiManager = APIManager()
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0.00 , to: self.apiManager.gameDetail.averageExcitement)
                    //.stroke(Color.pink, lineWidth: 5)
                    .stroke(LinearGradient(gradient: Gradient(colors:[.yellow, .red]), startPoint: .bottomTrailing, endPoint: .top), lineWidth: 7)
                    .frame(width:70,height: 70)
                    .rotationEffect(.degrees(-90))
                    .animation(.default)
                
//                Circle()
//                    .trim(from: 0.00 , to: self.apiManager.gameDetail.averageExcitement)
//                    //.stroke(Color.pink, lineWidth: 5)
//                    .stroke(LinearGradient(gradient: Gradient(colors:[.yellow, .red]), startPoint: .bottomTrailing, endPoint: .top), lineWidth: 5)
//                    .frame(width:50,height: 50)
//                    .rotationEffect(.degrees(-90))
//                    .animation(.default)
                //test
                
                Text(apiManager.gameDetail.time+"\'")
                    .font(.subheadline)
                    .fontWeight(Font.Weight.light)
                   
                
                Circle()
                    .trim(from: 0.00 , to: apiManager.gameDetail.bbOne)
                    .stroke(Color.red, lineWidth: 6)
                    .frame(width:50,height: 50)
                    .rotationEffect(.degrees(-90))
                    .animation(.default)
                   
                Circle()
                    .trim(from: apiManager.gameDetail.bbOne , to: 1.00)
                    .stroke(Color.blue, lineWidth: 6)
                    .frame(width:50,height: 50)
                    .rotationEffect(.degrees(-90))
                    .animation(.default)
                   
                HStack{
                    VStack{
                        Image("ajax")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:30, height:30, alignment: .center)
                            .cornerRadius(12)
                            .clipped()
                            .offset(x:-50,y:0)
                        Text(String(apiManager.gameDetail.scoreA))
                            .font(.subheadline)
                            .offset(x:-50,y:0)
                        Text("-")
                        .font(.subheadline)
                        .offset(x:-51,y:-14)
                            .foregroundColor(Color.blue)
                        
                    }
                    
                    VStack{
                        
                        Image("feyenoord")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:30, height:30, alignment: .center)
                            .cornerRadius(12)
                            .clipped()
                            .offset(x:50,y:0)
                        Text(String(apiManager.gameDetail.scoreB))
                        .font(.subheadline)
                        .offset(x:50,y:0)
                        Text("-")
                        .font(.subheadline)
                            .offset(x:51,y:-14)
                        .foregroundColor(Color.red)
                        
                    }
                    
                }
                
            }.offset(x:0,y:5)
              
            
            //https://stackoverflow.com/questions/56437036/swiftui-how-do-i-change-the-background-color-of-a-view
            //            Button(action:{
            //                withAnimation {
            //                    self.showDetail.toggle()
            //                }
            //            })
            //            if showDetail{
            //
            //            }
            GraphView()
            //Divider()
            Excitement()
        }
        //.background(Color.red.opacity(0.3)).edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
